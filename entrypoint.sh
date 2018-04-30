#!/bin/sh

set -e

exec fluentd -c /fluentd/etc/${FLUENTD_CONF} --gemfile /fluentd/Gemfile ${FLUENTD_OPT}
