FROM golang:1-bullseye as build

LABEL maintainer="Leon Jacobs <leonja511@gmail.com>"

COPY . /src

WORKDIR /src
RUN make docker

# final image
# https://github.com/chromedp/docker-headless-shell#using-as-a-base-image
FROM chromedp/headless-shell:latest

# Установка необходимых зависимостей, включая Python и библиотеки Python
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  dumb-init fonts-noto fonts-noto-cjk \
  python3 python3-pip \
  && apt-get install -y python3-requests python3-jinja2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

COPY --from=build /src/gowitness /usr/local/bin
COPY gowitness_reporter /app

EXPOSE 7171

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/sh", "/app/run.sh"]
