# This file is released under the CC0 1.0 Universal (CC0 1.0) Public Domain Dedication.
# See the LICENSE.txt file or https://creativecommons.org/publicdomain/zero/1.0/ for details.

ARG postgres_version=latest
ARG pgtap_version=1.2.0
FROM postgres:${postgres_version}
ARG pgtap_version

LABEL dev.telitas.project.repository="https://github.com/telitas/postgresql-with-pgtap.docker"
LABEL dev.telitas.base.repository="https://hub.docker.com/_/postgres"

RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y make
RUN apt-get install -y patch

RUN cpan cpan TAP::Parser::SourceHandler::pgTAP

ADD https://api.pgxn.org/dist/pgtap/${pgtap_version}/pgtap-${pgtap_version}.zip /tmp/
RUN unzip /tmp/pgtap-${pgtap_version}.zip -d /tmp/
RUN mv /tmp/pgtap-${pgtap_version} /tmp/pgtap

RUN make --directory=/tmp/pgtap
RUN make install --directory=/tmp/pgtap
# RUN make installcheck --directory=/tmp/pgtap

RUN rm -rf /tmp/*
RUN apt-get clean
