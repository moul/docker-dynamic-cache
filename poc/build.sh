#!/bin/sh

(
    sleep 1
    cat <<EOF | docker exec -i "$(docker ps -lq)" /bin/sh
set -x;
date > /root/date.txt;
echo continue > /tmp/fifo
EOF
    docker exec -it "$(docker ps -q)" date > /tmp/date.txt
) &
docker build -t moul/dynamic-cache:poc .
