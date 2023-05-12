#!/bin/bash

# Define the source directory containing the Docker volumes
SOURCE_DIR="/var/lib/docker/volumes/"

# Define the destination directory for the backup
DEST_DIR="/backup/docker-volumes"

# Define the list of Docker volume directories to backup
VOLUME_DIRS=("besidizer_appv" "besidizer_demov" "besidizer_nginxv")

# Loop through each volume directory and backup using rsync
for volume_dir in "${VOLUME_DIRS[@]}"
do
    rsync -avh --delete "${SOURCE_DIR}${volume_dir}/" "${DEST_DIR}/${volume_dir}/"
done

