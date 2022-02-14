#!/bin/bash

# usage: ./makebuild.sh name winerepo branch
# example: ./makebuild.sh lutris 6.10-7 https://github.com/lutris/wine lutris-6.10-7
# build name output: wine-lutris-6.10-7-x86_64.tar.xz

vagrant up

# start build
vagrant ssh -c "ssh ubuntu@buildbot-bionic-amd64 \"cd buildbot/runners/wine && bash -x ./build.sh --as $1 --version $2 --with $3 --branch $4 --noupload --keep-upload-file --dependencies --usemingw\""

vagrant ssh -c 'ssh ubuntu@buildbot-bionic-amd64 "mv buildbot/runners/wine/wine-*.tar.xz ~/"'
vagrant ssh -c 'scp ubuntu@buildbot-bionic-amd64:/home/ubuntu/wine-*.tar.xz /vagrant/'
vagrant ssh -c 'ssh ubuntu@buildbot-bionic-amd64 "rm ~/wine-*.tar.xz"'

vagrant halt
