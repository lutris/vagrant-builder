#!/bin/bash
set -e
vagrant up
vagrant ssh -c "ssh ubuntu@buildbot-bionic-amd64 \"cd buildbot && git pull origin master\""
vagrant ssh -c "ssh ubuntu@buildbot-bionic-i386 \"cd buildbot && git pull origin master\""
vagrant halt
echo "Buildbot updated"
