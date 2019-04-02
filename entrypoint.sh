#!/bin/bash

if [ fran_DEBUG = 1 ]; then
  ls -lrt / | grepfran
  ls -lrt /fran
fi
source /fran/config

source /fran/init.sh

[ -f /fran/setup ] || {
  source /fran/setup.sh
}

source /fran/service.sh
