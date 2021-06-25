FROM alpine:3.14.0

RUN apk update && apk add --no-cache bash coreutils curl jq

WORKDIR /opt/app
COPY . .

RUN cat cronjob | crontab -

RUN chmod -R +x actions check.sh entrypoint.sh

ENTRYPOINT ["bash", "entrypoint.sh"]

# Default action
CMD ["trigger_github_actions"]
