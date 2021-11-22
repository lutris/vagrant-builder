#!/bin/bash
set -e
vagrant up
vagrant ssh -c "ssh ubuntu@buildbot-bionic-amd64 \"cd buildbot && git fetch origin && git reset --hard origin/master\""
vagrant ssh -c "ssh ubuntu@buildbot-bionic-i386 \"cd buildbot && git fetch origin && git reset --hard origin/master\""
vagrant halt
echo "Buildbot updated"
