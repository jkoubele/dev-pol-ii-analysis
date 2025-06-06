#!/bin/bash

script_directory="$(cd "$(dirname "$0")" && pwd)"
repository_path="$(dirname "$script_directory")"
output_folder="$repository_path/docker_images"

# Create output folder if it doesn't exist
mkdir "$output_folder" -p

# build and save docker images
docker build -t bioinfo_tools "$repository_path/dockerfiles/bioinfo_tools"
docker save -o "$output_folder"/bioinfo_tools.tar bioinfo_tools

docker build -t pol_ii_bioconductor "$repository_path/dockerfiles/pol_ii_bioconductor"
docker save -o "$output_folder"/pol_ii_bioconductor.tar pol_ii_bioconductor

