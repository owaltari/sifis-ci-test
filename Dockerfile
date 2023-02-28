FROM alpine:3.11

RUN apk --no-cache update   && \
    apk upgrade             && \
    apk add python3
RUN pip3 install flask

COPY ci-test /home/ci-test

EXPOSE 5050/tcp

WORKDIR /home/ci-test

ENTRYPOINT ["/usr/bin/python3", "/home/ci-test/ci-test.py"]
