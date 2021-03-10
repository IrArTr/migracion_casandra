#!/bin/bash

echo "Se sacara backup de las siguientes tablas:"

cqlsh -e "USE thehive; DESC TABLES;"

echo -e " Desea Continuar? \n [si o no]"

read condicion
if [ $condicion = si ]
then

mkdir /tmp/backup

cqlsh -e "COPY thehive.edgestore_lock_ to '/tmp/backup/edgestore_lock_.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.edgestore to '/tmp/backup/edgestore.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.graphindex to '/tmp/backup/graphindex.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.system_properties_lock_ to '/tmp/backup/system_properties_lock_.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.system_properties to '/tmp/backup/system_properties.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.graphindex_lock_ to '/tmp/backup/graphindex_lock_.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.janusgraph_ids to '/tmp/backup/janusgraph_ids.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.systemlog to '/tmp/backup/systemlog.csv' WITH HEADER = true"
cqlsh -e "COPY thehive.txlog to '/tmp/backup/txlog.csv' WITH HEADER = true"

cd /tmp && zip backup.zip backup/*

echo "El backup se encuentra en /tmp/backup.zip"

else

echo "adios"
fi
