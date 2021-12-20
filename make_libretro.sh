#!/bin/bash
vagrant up

# start build
vagrant ssh -c "ssh ubuntu@buildbot-bionic-amd64 \"cd buildbot/runners/libretro && ./build.sh -d -n\""
vagrant ssh -c 'ssh ubuntu@buildbot-bionic-amd64 "mv buildbot/runners/libretro/*.tar.xz ~/"'
vagrant ssh -c 'scp ubuntu@buildbot-bionic-amd64:/home/ubuntu/*.tar.xz /vagrant/'
vagrant ssh -c 'ssh ubuntu@buildbot-bionic-amd64 "rm ~/*.tar.xz" '
vagrant halt
