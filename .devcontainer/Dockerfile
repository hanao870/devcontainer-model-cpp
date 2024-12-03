# pre-commit を使用するために python のベースイメージを選択
FROM python:3.13.0

# 開発用パッケージインストール
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        g++ \
        gdb \
        cmake \
        git \
        clang-format \
        tzdata \ 
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

ENV TZ Asia/Tokyo

# Google Test インストール
WORKDIR /tmp
RUN git clone https://github.com/google/googletest.git -b v1.15.2
WORKDIR /tmp/googletest/_build
RUN cmake -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_BUILD_TYPE=Release .. 
RUN make && make install 

# 開発用非 root ユーザ追加. 詳細は以下を参照
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
ARG USERNAME=dev-user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
        && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
        #
        # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
        && apt-get update \
        && apt-get install -y sudo \
        && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
        && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
