FROM alpine:edge as final
ARG VERSION=latest
ARG GLIBC_VERSION=2.31
RUN apk update && apk upgrade && apk add bitcoin sudo && \
	mkdir -p /var/lib/bitcoin && \
	mkdir -p /etc/bitcoin

# cli arguments from https://en.bitcoin.it/wiki/Running_Bitcoin
ENTRYPOINT chown -R bitcoin /var/lib/bitcoin && \
			chown -R bitcoin /etc/bitcoin && \
			sudo -u bitcoin bitcoind -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoin
