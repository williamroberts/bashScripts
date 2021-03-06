#!/usr/bin/env bash

function docknone() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ];
  then
    echo "";
    echo "Name:           $FUNCNAME";
    echo "Description:    Removes untagged Docker images that are untagged (appear as '<none>' in the list generated by 'docker images')";
    echo "Usage:";
    echo "";
    echo "    docknone"
    echo "";
    return 0;
  fi;

  __docknone__process;
}

function __docknone__process() {
  # TODO: Test if the grep returns anything
  docker rmi -f "$(docker images | grep none | awk '{print $3}')";
}
