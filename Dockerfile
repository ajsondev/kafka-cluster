FROM java:openjdk-8-jre
MAINTAINER sundyli <543950155@qq.com>

ARG version=0.10.0.0
ARG scala=2.10
ARG version=0.10.0.0
WORKDIR /opt/kafka

EXPOSE 9092


##download install
RUN set -x \
    && apt-get install -y wget tar \
	&& wget https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/${version}/kafka_${scala}-${version}.tgz \
	&& tar  -C /opt/kafka --strip-components=1 -xzvf kafka_${scala}-${version}.tgz \
	&& rm kafka_${scala}-${version}.tgz \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


##default config
env dataLogDir=/data/db

# add startup script
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/opt/kafka/entrypoint.sh"]