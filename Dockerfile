FROM ubuntu:18.04

SHELL ["bash", "-c"]

RUN apt update && \
	apt dist-upgrade -y && \
	apt install -y spamassassin \
		spampd rsyslog pyzor

CMD rsyslogd;spampd --debug --nodetach --port=10025 --relayhost=127.0.0.1:10026 --tagall --log-rules-hit --maxsize=2048
