FROM fluent/fluentd:v0.12.33

USER root

# WORKDIR /home/fluent
# ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

COPY Gemfile* /fluentd/
RUN set -ex \
    && apk upgrade --no-cache \
    && apk add --no-cache ruby-bundler \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
        libffi-dev \
    && bundle config silence_root_warning true \
    && bundle install --gemfile=/fluentd/Gemfile --path=/fluentd/vendor/bundle \
    && apk del .build-deps \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY ./conf/fluent.conf /fluentd/etc/
COPY ./conf/kubernetes.conf /fluentd/etc/

COPY plugins /fluentd/plugins/
COPY entrypoint.sh /fluentd/entrypoint.sh

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# Run Fluentd
CMD ["/fluentd/entrypoint.sh"]
