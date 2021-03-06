#!/bin/bash
set -o errexit

su - oneadmin -c '/tmp/one-auth.sh'
rm /tmp/one-auth.sh

# Start supervisord
/usr/bin/supervisord

# Start supervisor programs
/usr/bin/supervisorctl start opennebula
/usr/bin/supervisorctl start opennebula-scheduler

# Tail the logs to keep supervisor writing to stdout
tail -f /tmp/supervisord.log
