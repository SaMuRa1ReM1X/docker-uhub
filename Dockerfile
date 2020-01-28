FROM alpine:latest

ENV HOME /root

#UPDATE PACKAGE INDEX AND INSTALL GIT + CMAKE
RUN apk update && apk upgrade && \
	apk add --no-cache sqlite-dev openssl-dev build-base cmake make gcc git

RUN git clone https://github.com/janvidar/uhub.git

RUN cd uhub/ && \
	cmake . && \
	make && \
	make install

EXPOSE 1151

ENTRYPOINT ["./uhub"]
