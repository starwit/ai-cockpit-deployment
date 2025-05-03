#!/bin/bash

main() {
    echo "check if there is subfolders"

    local folder_path="$1"
    if [[ -d "$folder_path" ]]; then
        local subfolders
        subfolders=$(find "$folder_path" -mindepth 1 -maxdepth 1 -type d)
        if [[ -n "$subfolders" ]]; then
            echo "Total subfolders: $(echo "$subfolders" | wc -l)"
            echo "create minio bucket each"
            create_buckets "$subfolders" $2 $3 $4
        else
            echo "No subfolders found."
            echo "Total subfolders: 0"
            setup_single_bucket "$@"
        fi
    else
        echo "Error: '$folder_path' is not a valid directory."
    fi
}

create_buckets() {
    path_array=($1)
    mc alias set myminio $2 $3 $4

    for i in "${path_array[@]}"
    do
        bucket_name=`basename $i`
        echo "creating bucket for folder $bucket_name"
        mc mb myminio/$bucket_name
        mc policy set public myminio/$bucket_name
        mc cp --recursive $i/* myminio/$bucket_name
    done 
}

setup_single_bucket() {
    echo "Importing binary data from $4 to minio at $1"

    /bin/mc alias set myminio $1 $2 $3
    /bin/mc mb -p myminio/anomalies
    /bin/mc ls myminio
    /bin/mc policy set public myminio/anomalies
    /bin/ls -al $4
    /bin/mc cp --recursive $4/* myminio/anomalies
    exit 0
}

main "$@"