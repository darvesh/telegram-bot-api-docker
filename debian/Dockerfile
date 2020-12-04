FROM debian:buster-slim as builder

RUN apt-get update
RUN apt-get install -y make git zlib1g-dev libssl-dev gperf cmake g++

WORKDIR /app
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR /app/telegram-bot-api
RUN rm -rf build
RUN mkdir build
WORKDIR /app/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install -j 5

FROM debian:buster-slim
RUN apt-get update
RUN apt-get install -y zlib1g libssl1.1
COPY --from=builder /usr/local/bin/telegram-bot-api /usr/local/bin/telegram-bot-api

ENTRYPOINT ["/usr/local/bin/telegram-bot-api"]
