#!/bin/bash
vagrant up

# start build
vagrant ssh -c "ssh ubuntu@buildbot-bionic-amd64 \"sudo apt update\""
vagrant ssh -c "ssh ubuntu@buildbot-bionic-i386 \"sudo apt update\""
vagrant ssh -c "ssh ubuntu@buildbot-bionic-amd64 \"cd buildbot/runners/web && bash -x ./build.sh\""
vagrant ssh -c 'ssh ubuntu@buildbot-bionic-amd64 "mv buildbot/runners/web/web-*.tar.xz ~/"'
vagrant ssh -c 'scp ubuntu@buildbot-bionic-amd64:/home/ubuntu/web-*.tar.xz /vagrant/'
vagrant ssh -c 'ssh ubuntu@buildbot-bionic-amd64 "rm ~/web-*.tar.xz" '
vagrant halt
