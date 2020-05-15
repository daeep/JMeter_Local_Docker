# 1 From Apline Linux
FROM alpine:3.11

# 2 Maintainer name
LABEL maintainer="antonio@flood.io"

# 3 Copy local JMeter to the image and set environment variables
ARG JMETER_FILE="apache-jmeter-5.2.1.tgz"
ARG JMETER_FOLDER="apache-jmeter-5.2.1"
COPY ${JMETER_FILE} /tmp/
ENV JMETER_HOME /home/jmeter/${JMETER_FOLDER}
ENV	JMETER_BIN ${JMETER_HOME}/bin

# 4 Update & Upgrade, then decompress local JMeter and delete tar ball file
RUN apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk8-jre tzdata curl unzip bash \
	&& apk add --no-cache nss \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p ${JMETER_HOME} \
	&& tar -zvxf /tmp/${JMETER_FILE} -C /home/jmeter/ \
	&& rm -f /tmp/${JMETER_FILE}

# 5 copy entrypoint to the container 
COPY entrypoint.sh /

# 6 Set environment variables
ENV PATH $PATH:$JMETER_BIN

# 7 Set Working Dir
WORKDIR ${JMETER_HOME}

# 8 Launch entrypoint
ENTRYPOINT ["/entrypoint.sh"]