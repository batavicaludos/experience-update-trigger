FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl python3

WORKDIR /opt/app
COPY . .

CMD ["bash", "check.sh"]
