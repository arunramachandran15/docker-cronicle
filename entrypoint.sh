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

if [ $1 == true ]
then
  touch $1
fi

if [ ! -f $DATA_DIR/.setup_done ]
then
  npm install aws-sdk
  cp $CONF_DIR/config.json $CONF_DIR/config.json.origin
  if [ -f $DATA_DIR/config.json.import ]
  then
    cp $DATA_DIR/config.json.import $CONF_DIR/config.json
  fi

  if [ $1 == true ]
  then
    $BIN_DIR/control.sh setup
  fi

  cp $CONF_DIR/config.json $CONF_DIR/config.json.origin
  if [ -f $DATA_DIR/config.json.import ]
  then
    cp $DATA_DIR/config.json.import $CONF_DIR/config.json
  fi
  mkdir -p $PLUGINS_DIR
fi

/usr/local/bin/node "$LIB_DIR/main.js"
