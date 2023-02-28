FROM --platform=$BUILDPLATFORM alpine:3.11

RUN apk --no-cache update   && \
    apk upgrade             && \
    apk add python3
RUN pip3 install flask

ARG TARGETPLATFORM

COPY ci-test /home/ci-test

RUN echo "$TARGETPLATFORM" > /home/ci-test/TARGETPLATFORM

EXPOSE 5050/tcp

WORKDIR /home/ci-test

ENTRYPOINT ["/usr/bin/python3", "/home/ci-test/ci-test.py"]
