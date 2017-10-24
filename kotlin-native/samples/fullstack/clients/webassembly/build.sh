#!/usr/bin/env bash

case "$OSTYPE" in
  darwin*)  ;;
  *)        echo "Cannot compile WASM32 on $OSTYPE" && exit 0;;
esac


DIR=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )
PATH=$KONAN_HOME/bin:$PATH
STATIC_DIR=$DIR/../../static/
mkdir -p $STATIC_DIR

konanc src/main/kotlin/StatView.kt \
    -r $DIR/../../../../external/klib \
    -l canvas -l jsinterop \
    -target wasm32 -o $DIR/../../static/view

cp ./index.html $STATIC_DIR
