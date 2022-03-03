#!/bin/sh

exec /go/bin/shapeshifter-dispatcher \
    -$PMODE \
    -$OMODE \
    -state /config/ \
    -orport $ORPORT \
    -transports $TRANSPORTS \
    -bindaddr $TRANSPORTS-$BINDADDR \
    $ARGS
