# Docker image for [Telegram Bot API](https://github.com/tdlib/telegram-bot-api)

[DockerHub](https://hub.docker.com/r/darvesh/telegram-bot-api)

<p align="left">
	<!-- Github Issues -->
  <a>
    <img src="https://img.shields.io/github/issues/darvesh/telegram-bot-api-docker?style=flat-square" alt=Github Issues"/>
  </a>
   <img src="https://github.com/darvesh/telegram-bot-api-docker/workflows/Build%20and%20push%20telegram-bot-api%20image%20to%20DockerHub/badge.svg" alt="build status"/>
</p>


# Usage
You can pass whatever arguments you normally pass to telegram-bot-api with docker run command after the image name.

```docker run -p 0.0.0.0:8081:8081 -p 0.0.0.0:8082:8082 darvesh/telegram-bot-api:latest --api-id=<your-api-id> --api-hash='<your-api-hash>' --http-port=8081 --http-stat-port=8082 --local```

The only mandatory options are `--api-id` and `--api-hash`. You must obtain your own `api-id` and `api-hash`
as described in https://core.telegram.org/api/obtaining_api_id and specify them using the `--api-id` and `--api-hash` options.

The Telegram Bot API server accepts only HTTP requests, so a TLS termination proxy needs to be used to handle remote HTTPS requests.
By default the Telegram Bot API server is launched on the port 8081, which can be changed using the option `--http-port`.

## Supported tags
* [latest, alpine](https://github.com/darvesh/telegram-bot-api-docker/blob/master/alpine/Dockerfile)
* [debin-buster-slim](https://github.com/darvesh/telegram-bot-api-docker/blob/master/debian/Dockerfile)

## Note: 
* This is an unofficial image of telegram-bot-api
* Only supports linux
