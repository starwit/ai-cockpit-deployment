#!/bin/sh

echo "Importing binary data from $4 to minio at $1"

/bin/mc alias set myminio $1 $2 $3
/bin/mc mb -p myminio/anomalies
/bin/mc ls myminio
/bin/mc policy set public myminio/anomalies
/bin/ls -al $4
/bin/mc cp --recursive $4/* myminio/anomalies
exit 0