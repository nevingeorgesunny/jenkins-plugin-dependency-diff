#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <group_id> <artifact_id> <old_version> <new_version>"
  exit 1
fi

# Assign command-line arguments to variables
GROUP_ID="$1"
ARTIFACT_ID="$2"
VERSION_OLD="$3"
VERSION_NEW="$4"

PACKAGING="hpi"
MVN_REPO="$HOME/.m2/repository"

EXTRACTED_DIR="extracted"
# Convert dots to slashes in GROUP_ID
GROUP_ID_PATH=$(echo $GROUP_ID | tr '.' '/')

# Function to download and extract the artifact
download_and_extract() {
  local version=$1
  local hpi_path="$MVN_REPO/$GROUP_ID_PATH/$ARTIFACT_ID/$version/$ARTIFACT_ID-$version.$PACKAGING"

  echo "running : mvn dependency:get -DartifactId=$ARTIFACT_ID -DgroupId=$GROUP_ID -Dpackaging=$PACKAGING -Dversion=$version -Dtransitive=false"

  mvn dependency:get -DartifactId=$ARTIFACT_ID -DgroupId=$GROUP_ID -Dpackaging=$PACKAGING -Dversion=$version -Dtransitive=false

  echo "running : unzip $hpi_path -d $EXTRACTED_DIR"
  unzip $hpi_path -d $EXTRACTED_DIR
}

# Run the first set of commands
download_and_extract $VERSION_OLD

# Output 1
ls $EXTRACTED_DIR/WEB-INF/lib > old_dependency.txt
# Output 2
cat $EXTRACTED_DIR/META-INF/MANIFEST.MF > old_plugin_dependency.txt

# Cleanup
rm -rf $EXTRACTED_DIR


# Run the second set of commands
download_and_extract $VERSION_NEW

# Output 1.2
ls $EXTRACTED_DIR/WEB-INF/lib > new_dependency.txt
# Output 2.2
cat $EXTRACTED_DIR/META-INF/MANIFEST.MF > new_plugin_dependency.txt

# Cleanup
rm -rf $EXTRACTED_DIR

echo "**********************************"

echo "Old dependency:"
cat old_dependency.txt

echo "New dependency:"
cat new_dependency.txt

echo "**********************************"

echo "Old manifest:"
cat old_plugin_dependency.txt

echo "New manifest:"
cat new_plugin_dependency.txt

echo "**********************************"