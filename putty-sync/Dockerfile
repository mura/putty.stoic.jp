FROM golang:buster as builder

WORKDIR /build

COPY go.* ./
RUN go mod download

COPY invoke.go ./
RUN go build -mod=readonly -v -o server

FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim

RUN apt-get update && apt-get install -y \
  rsync \
  ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /build/server /app/server
COPY sync.sh ./
COPY html/ html/
RUN mkdir -p site

ENV PUTTY_URL="rsync://rsync.chiark.greenend.org.uk/ftp/users/sgtatham/putty-website-mirror/"
ENV BUCKET_NAME=

CMD ["/app/server"]
