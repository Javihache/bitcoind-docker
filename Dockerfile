FROM arm64v8/alpine:edge
ARG VERSION=0.20.1-r0
ARG GLIBC_VERSION=2.32-r0
RUN apk update && apk upgrade && apk add bitcoin sudo && \
	mkdir -p /var/lib/bitcoin && \
	mkdir -p /etc/bitcoin

# cli arguments from https://en.bitcoin.it/wiki/Running_Bitcoin
ENTRYPOINT chown -R bitcoin /var/lib/bitcoin && \
			chown -R bitcoin /etc/bitcoin && \
			sudo -u bitcoin bitcoind -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoin
