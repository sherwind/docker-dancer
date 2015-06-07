# ported from rails
FROM perl:5.20
MAINTAINER Sherwin Daganato sherwin@daganato.com

RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN cpanm Carton Starman Dancer2@0.160003 && rm -rf /root/.cpanm
