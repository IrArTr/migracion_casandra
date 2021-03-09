#!/bin/bash

echo "Para poder migrar los dato recuerda que el schema deve ser el mismo"

echo "ELIGE TU KEYSPACE"

cqlsh -e "DESC KEYSPACEs"

read KEYSPACE

echo -e "EL KEYSPACE QUE ELEGISTE FUE:\n $KEYSPACE"

echo -e "AHORA ESTAS SON LAS TABLAS DENTRO DE $KEYSPACE \n SELECCIONA EL NOMBRE DE LA TABLA QUE SE RECUPERAR \n SE PROCEDERA A ELIMNAR LOS DATOS DE ESA TABLA PARA PODER LLENARLA CON LOS DATOS QUE ESTAMOS MIGRANDO:"

cqlsh -e "USE thehive; DESC TABLES;"

#echo -e "ejemplo \n $KEYSPACE.edgestore"

read TABLE

echo -e "LA TABLA QUE SE RECUPERARA ES $KEYSPACE.$TABLE"
echo "ASEGURATE QUE LOS archivos.csv estan en esta misma direccion:"
echo -e  "estos son tus archivos.csv actuales en este directorio, recuerda que el archivo.csv que usaremos ahora \n tiene que ser de una tabla con el mismo schema de la tabla de la que lo sacamos"

ls $PWD

echo -e "INGRESA EL NOMBRE DE TU archivo.csv "

read archivo

echo -e "SE PROCEDERA A COPIAR LOS DATOS, ESTO PUEDE TOMAR UN TIEMPO DEPENDIENDO DEL TAMANO"

cqlsh -e "TRUNCATE $KEYSPACE.$TABLE"
cqlsh -e "COPY $KEYSPACE.$TABLE FROM '$PWD/$archivo' WITH HEADER = true and CHUNKSIZE = 1"

echo -e "SE COMPLETO LA COPIA DESEA COPIAR OTRa tabla??"

echo "[si o no]"

read condicion

while [ $condicion = si ]
do
echo "Para poder migrar los dato recuerda que el schema deve ser el mismo"

echo "ELIGE TU KEYSPACE"

cqlsh -e "DESC KEYSPACEs"

read KEYSPACE

echo -e "EL KEYSPACE QUE ELEGISTE FUE:\n $KEYSPACE"

echo -e "AHORA ESTAS SON LAS TABLAS DENTRO DE $KEYSPACE \n SELECCIONA EL NOMBRE DE LA TABLA QUE SE RECUPERAR \n SE PROCEDERA A ELIMNAR LOS DATOS DE ESA TABLA PARA PODER COPIAR LOS DATOS"

cqlsh -e "USE thehive; DESC TABLES;"

#echo -e "ejemplo \n $KEYSPACE.edgestore"

read TABLE

echo -e "LA TABLA QUE SE RECUPERARA ES $KEYSPACE.$TABLE"
echo -e "INGRESA EL NOMBRE DE TU archivo.csv "
echo "ASEGURATE QUE LOS archivos.csv estan en esta misma direccion:"
echo -e  "estos son tus archivos.csv actuales en este directorio, recuerda que el archivo.csv que usaremos ahora \n tiene que ser de una tabla con el mismo schema que la tabla de donde lo sacamos"

ls $PWD 

read archivo

echo -e "SE PROCEDERA A COPIAR LOS DATOS, ESTO PUEDE TOMAR UN TIEMPO DEPENDIENDO DEL TAMANO"

cqlsh -e "TRUNCATE $KEYSPACE.$TABLE"
cqlsh -e "COPY $KEYSPACE.$TABLE FROM '$PWD/$archivo' WITH HEADER = true and CHUNKSIZE = 1"

echo -e "SE COMPLETO LA COPIA DESEA COPIAR OTRa tabla??"
echo "[si o no]"

read condicion

done
echo "adios"
