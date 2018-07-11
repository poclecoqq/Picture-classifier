#!/usr/bin/env bash

move=false
clean=false

for arg in "$@"; do
  case $arg in 
    -c|--clean)
      clean=true
    ;;
    -m|--move)
      move=true
    ;;
    *)
      echo unknow parameter "$arg"
  esac
done
