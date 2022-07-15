#!/bin/bash

# ************************* 
# This script is the first step in the process of removing the dependency on  
# the conda package tudat-resources. fetching the raw data files directly 
# from the tudat-resources Github repository. The script fetches a release with
# a specific version (hard coded) from a GitHub repository and downloads it to 
# a specific location on the host machine.
#
# The script is run automatically by conda as the last step of the package
# installation process on the host machine.
# 
# This script will eventually be moved to the tudat-feedstock recipe. It is
# added here now for testing purposes. The version of the release to be 
# downloaded will be referenced from the meta.yml of the conda package tudat 
# *************************


PKG_VERSION=v1.2.1.dev5
RESOURCE_GITHUB_URL="https://github.com/niketagrawal/tudat-resources/archive/refs/tags/$PKG_VERSION.tar.gz"

# Target location on the host machine where the release will be downloaded to
TARGET_LOCATION=$HOME/tudatresource/

# Create the target directory on the host machine
mkdir -p $TARGET_LOCATION

cd $TARGET_LOCATION

# Fetch the Github release containing the raw data files
wget $RESOURCE_GITHUB_URL


