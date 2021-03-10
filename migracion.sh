#!/bin/bash

echo "Los archivos .csv necesitan estar en la misma carpeta donde esta el script"
echo "Se migraran las siguientes tablas:"

ls $PWD

echo -e  "Para poder migrar los datos se borraran los contenidos en las tablas  Desea Continuar? \n [si o no]"

read condicion
if [ $condicion = si ]
then

cqlsh -e "TRUNCATE thehive.edgestore"
cqlsh -e "COPY thehive.edgestore FROM '$PWD/edgestore.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.edgestore_lock_"
cqlsh -e "COPY thehive.edgestore_lock_ FROM '$PWD/edgestore_lock_.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.graphindex"
cqlsh -e "COPY thehive.graphindex FROM '$PWD/graphindex.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.graphindex_lock_"
cqlsh -e "COPY thehive.graphindex_lock_ FROM '$PWD/graphindex_lock_.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.janusgraph_ids"
cqlsh -e "COPY thehive.janusgraph_ids FROM '$PWD/janusgraph_ids.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.system_properties"
cqlsh -e "COPY thehive.system_properties FROM '$PWD/system_properties.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.system_properties_lock_"
cqlsh -e "COPY thehive.system_properties_lock_ FROM '$PWD/system_properties_lock_.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.systemlog"
cqlsh -e "COPY thehive.systemlog FROM '$PWD/systemlog.csv' WITH HEADER = true and CHUNKSIZE = 1"

cqlsh -e "TRUNCATE thehive.txlog"
cqlsh -e "COPY thehive.txlog FROM '$PWD/txlog.csv' WITH HEADER = true and CHUNKSIZE = 1"

echo "se termino la migracion"

else

echo "adios"
fi
