FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake

WORKDIR /app
RUN apk update
RUN apk upgrade
RUN apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR /app/telegram-bot-api
RUN rm -rf build
RUN mkdir build
WORKDIR /app/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install

ENV PORT=8081
ENV STAT_PORT=8082
ENV API_ID=""
ENV API_HASH=""

CMD /usr/local/bin/telegram-bot-api --http-port=$PORT --http-stat-port=$STAT_PORT --api-id=$API_ID --api-hash=$API_HASH --local
