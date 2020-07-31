FROM golang:1.13-alpine3.10

# Add build tools.
RUN apk --no-cache --virtual build-dependencies add \
	build-base \
	git

WORKDIR /go/src/github.com/HAECHI-LABS/btcd

# Grab and install the latest version of btcd and all related dependencies.
COPY . .
RUN GO111MODULE=on go install -v . ./cmd/...

# Expose mainnet ports (server, rpc)
EXPOSE 8333 8334

# Expose testnet ports (server, rpc)
EXPOSE 18333 18334

# Expose simnet ports (server, rpc)
EXPOSE 18555 18556

# Expose segnet ports (server, rpc)
EXPOSE 28901 28902

CMD ["/go/bin/btcd"]