#!/bin/bash

curl -sSLO https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-armv7.tar.gz
tar xfvz node_exporter-0.18.1.linux-armv7.tar.gz
cp node_exporter-0.18.1.linux-armv7/node_exporter /usr/sbin/node_exporter
rm -rf node_exporter*

curl -sSLo - https://raw.githubusercontent.com/prometheus/node_exporter/master/examples/systemd/node_exporter.service   |sed -e 's|/etc/sysconfig/node_exporter|/etc/default/node_exporter|' |sed -e 's/^User.*//'  > /etc/systemd/system/node_exporter.service
curl -sSLo - https://raw.githubusercontent.com/prometheus/node_exporter/master/examples/systemd/sysconfig.node_exporter   |sed -e 's/^OPTIONS/#OPTIONS/;aOPTIONS=""' >/etc/default/node_exporter

systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
