#!/bin/bash
ROOT_DIR=/opt/cronicle
CONF_DIR=$ROOT_DIR/conf
BIN_DIR=$ROOT_DIR/bin
LIB_DIR=$ROOT_DIR/lib
DATA_DIR=$ROOT_DIR/data
PLUGINS_DIR=$ROOT_DIR/plugins

rm -r $PLUGINS_DIR
rm -r /opt/cronicle/logs
export CRONICLE_Storage__Filesystem__base_dir=${DATA_DIR}
export CRONICLE_echo=1
export CRONICLE_foreground=1
npm install aws-sdk
if [ ! -f $DATA_DIR/.setup_done ]
then
  npm install aws-sdk
  
  cp $CONF_DIR/config.json $CONF_DIR/config.json.origin
  if [ -f $DATA_DIR/config.json.import ]
  then
    cp $DATA_DIR/config.json.import $CONF_DIR/config.json
  fi

  cp $ROOT_DIR/package.json $ROOT_DIR/package.json.origin
  if [ -f $DATA_DIR/package.json.import ]
  then
    cp $DATA_DIR/package.json.import $ROOT_DIR/package.json
  fi
  if [ ! -f $DATA_DIR/slave.json ]
  then
    touch slave.json
    $BIN_DIR/control.sh setup
  fi
  cp $CONF_DIR/config.json $CONF_DIR/config.json.origin
  if [ -f $DATA_DIR/config.json.import ]
  then
    cp $DATA_DIR/config.json.import $CONF_DIR/config.json
  fi
  npm install aws-sdk
  mkdir -p $PLUGINS_DIR
fi

/usr/local/bin/node "$LIB_DIR/main.js"
