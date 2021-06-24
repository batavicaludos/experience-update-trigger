FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl python3

WORKDIR /opt/app
COPY . .

RUN chmod +x ./check.sh

CMD ["bash", "check.sh"]
