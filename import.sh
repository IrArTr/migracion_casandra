#!/bin/bash

echo "ELIGE TU KEYSPACE"

cqlsh -e "DESC KEYSPACEs"

read KEYSPACE

echo -e "EL KEYSPACE QUE ELEGISTE FUE:\n $KEYSPACE"

echo -e "AHORA ESTAS SON LAS TABLAS DENTRO DE $KEYSPACE \n SELECCIONA EL NOMBRE DE LA TABLA QUE QUIERES MIGRAR:"

cqlsh -e "USE thehive; DESC TABLES;"

#echo -e "ejemplo \n $KEYSPACE.edgestore"

read TABLE

echo "LA TABLA: $KEYSPACE.$TABLE PROCEDERA A COPIARSE EN LA DIRECCION /tmp:"

cqlsh -e "COPY $KEYSPACE.$TABLE to '/tmp/$TABLE.csv' WITH HEADER = true"

echo "EL NOMBRE DEL ARCHIVO ES $TABLE.csv"

echo "quieres copiar otra tabla?"

echo "[si o no]"

read condicion

while [ $condicion = si ]
do
echo "ELIGE TU KEYSPACE"

cqlsh -e "DESC KEYSPACEs"

read KEYSPACE

echo -e "EL KEYSPACE QUE ELEGISTE FUE:\n $KEYSPACE"

echo -e "AHORA ESTAS SON LAS TABLAS DENTRO DE $KEYSPACE \n SELECCIONA EL NOMBRE DE LA TABLA QUE QUIERES MIGRAR:"

cqlsh -e "USE thehive; DESC TABLES;"

#echo -e "ejemplo \n thehive.edgestore"

read TABLE

echo "LA TABLA: $KEYSPACE.$TABLE PROCEDERA A COPIARSE AL DIRECTORIO /tmp"

cqlsh -e "COPY $KEYSPACE.$TABLE to '/tmp/$TABLE.csv' WITH HEADER = true"

echo "EL NOMBRE DEL ARCHIVO ES $TABLE.csv"

echo "quieres copiar otra tabla?"

echo "[si o no]"

read condicion

done
echo "sus archivos estan en /tmp ahora solo copielos donde ejecutara export.sh para migrar los datos"
