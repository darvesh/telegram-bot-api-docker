FROM alpine:latest as builder

RUN apk update
RUN apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake

WORKDIR /app
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR /app/telegram-bot-api
RUN rm -rf build
RUN mkdir build
WORKDIR /app/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install -j 5

FROM alpine:latest
RUN apk update
RUN apk add --no-cache zlib openssl libstdc++
COPY --from=builder /usr/local/bin/telegram-bot-api /usr/local/bin/telegram-bot-api

ENTRYPOINT ["/usr/local/bin/telegram-bot-api"]
