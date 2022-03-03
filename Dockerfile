FROM alpine

ENV ARGS=

ADD run.sh /run.sh
RUN chmod +x /run.sh

# Install Linux packages
RUN apk add -U --no-cache \
  git \
  go \
  netcat-openbsd

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p \
    ${GOPATH}/src \
    ${GOPATH}/bin \
    ${GOPATH}/shapeshifter-dispatcher \
    /config

# Grab and Build Shapeshifter
RUN git clone https://github.com/OperatorFoundation/shapeshifter-dispatcher.git ${GOPATH}/shapeshifter-dispatcher/
RUN cd ${GOPATH}/shapeshifter-dispatcher && go build && go install

# Expose Ports
EXPOSE 2222/tcp

# Set Up Volumes
VOLUME /config

CMD /run.sh
