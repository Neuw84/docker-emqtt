#!/bin/bash

set -e

EMQTTD_DIR=/root/emqttd

if [ "$1" = 'start-daemon' ]; then
    
    
    # start daemon
    $EMQTTD_DIR/bin/emqttd start

	

    # Start plugins
    #cd $EMQTTD_DIR/etc/plugins
    #for plugin in * ; do
      #plugin=(${plugin//./ })
      #echo $plugin
      #$EMQTTD_DIR/bin/emqttd_ctl plugins load emq_dashboard	
    #done

    # wait
    while true; do sleep 100; done
fi

exec "$@"
