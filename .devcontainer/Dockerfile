FROM debian:12.5

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
