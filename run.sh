#!/bin/sh

exec /go/bin/shapeshifter-dispatcher \
    -$PMODE \
    -$OMODE \
    -state $STATE \
    -orport $ORPORT \
    -transports $TRANSPORTS \
    -bindaddr $TRANSPORTS-$BINDADDR \
    -logLevel $LOGLEVEL \
    $ARGS
