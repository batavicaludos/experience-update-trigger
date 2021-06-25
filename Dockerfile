FROM alpine:3.14.0

RUN apk update && apk add --no-cache bash coreutils curl python3

WORKDIR /opt/app
COPY . .

RUN cat cronjob | crontab -

RUN chmod -R +x actions check.sh entrypoint.sh parse_json_field.py

ENTRYPOINT ["bash", "entrypoint.sh"]

# Default action
CMD ["trigger_github_actions"]
