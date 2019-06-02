FROM ubuntu:18.04

SHELL ["bash", "-c"]

RUN apt update && \
	apt dist-upgrade -y && \
	apt install -y spamassassin \
		spampd rsyslog pyzor razor && \
	echo "required_score 2.0" >> /etc/spamassassin/local.cf

CMD rsyslogd;spampd --debug --nodetach --host=0.0.0.0:10029 --relayhost=opensmtpd:10030 --tagall --log-rules-hit --maxsize=2048
