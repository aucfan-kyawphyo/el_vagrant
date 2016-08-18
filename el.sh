#!/bin/bash

cd /vagrant/rpm

# check elasticsearch file
if [ ! -f elasticsearch* ]
then
	wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.3.0/elasticsearch-2.3.0.rpm
else
  echo "Elasticsearch Is Already Exists So Need Not Wget"
fi
sudo yum -y install elasticsearch-2.3.0.rpm
sudo chkconfig --add elasticsearch
sudo chkconfig elasticsearch on
sudo service elasticsearch start
sudo rm /etc/elasticsearch/elasticsearch.yml
sudo bash -c 'cat << EOF > /etc/elasticsearch/elasticsearch.yml
network.host: 192.168.33.10
EOF'
sudo service elasticsearch restart

# install plugin
cd /usr/share/elasticsearch/
sudo bin/plugin install mobz/elasticsearch-head
sudo bin/plugin install elasticsearch/elasticsearch-analysis-kuromoji/2.3.0
sudo service elasticsearch restart
