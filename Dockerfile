FROM ruby:2.5

ENV RUBYOPT -EUTF-8

RUN apt-get update && \
    apt-get install -y libraptor2-0 && \
    rm -rf /var/lib/apt/lists/*

ADD . /clinvar-rdf/

RUN cd /clinvar-rdf && \
    bundle install && \
    rake install

COPY docker-entrypoint.sh /

WORKDIR /data

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["dbsnp-rdf", "--help"]
