FROM linuxserver/transmission

RUN apk add --no-cache python ffmpeg git php-cli && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

COPY phpsed.php /
COPY 20-config /etc/cont-init.d/

HEALTHCHECK CMD curl -f http://localhost:9091 || exit 1