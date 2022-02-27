FROM alpine

ENV PMODE transparent
ENV OMODE server
ENV STATE state
ENV ORPORT 127.0.0.1:3333
ENV TRANSPORTS obfs4
ENV BINDADDR 127.0.0.1:2222
ENV LOGLEVEL DEBUG
ENV ARGS=

ADD run.sh /run.sh
RUN chmod +x /run.sh

# Install Linux packages
RUN apk add -U --no-cache \
  git \
  go 

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin ${GOPATH}/shapeshifter-dispatcher

# Grab and Build Shapeshifter
RUN git clone https://github.com/OperatorFoundation/shapeshifter-dispatcher.git ${GOPATH}/shapeshifter-dispatcher/
RUN cd ${GOPATH}/shapeshifter-dispatcher && go build && go install

# Check Shapeshifter
RUN ./go/bin/shapeshifter-dispatcher -showVersion

RUN ls /tmp/

# Expose Ports
EXPOSE 2222/tcp
EXPOSE 3333/tcp

CMD /run.sh
