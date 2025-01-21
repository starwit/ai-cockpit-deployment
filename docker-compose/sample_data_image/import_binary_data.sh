#!/bin/sh

echo "Importing binary data from $4 to minio at $1"

/bin/mc alias set myminio $1 $2 $3
/bin/mc mb myminio/anomalies
/bin/mc policy set public myminio/anomalies
/bin/ls -al /scenariodata/$4/binary_data
/bin/mc cp --recursive /scenariodata/$4/binary_data/* myminio/anomalies
exit 0