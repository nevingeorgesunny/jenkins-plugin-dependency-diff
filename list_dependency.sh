#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <group_id> <artifact_id> <version_one> <version_two>"
  exit 1
fi

# Define colors
CYAN='\033[0;36m'
YELLOW='\033[33m'
NC='\033[0m' # No Color

# Assign command-line arguments to variables
GROUP_ID="$1"
ARTIFACT_ID="$2"
VERSION_ONE="$3"
VERSION_TWO="$4"

PACKAGING="hpi"
MVN_REPO="$HOME/.m2/repository"

EXTRACTED_DIR="extracted"
# Convert dots to slashes in GROUP_ID
GROUP_ID_PATH=$(echo $GROUP_ID | tr '.' '/')

# Function to download and extract the artifact
download_and_extract() {
  local version=$1
  local hpi_path="$MVN_REPO/$GROUP_ID_PATH/$ARTIFACT_ID/$version/$ARTIFACT_ID-$version.$PACKAGING"

  echo -e "\nrunning : ${YELLOW}mvn dependency:get -DartifactId=$ARTIFACT_ID -DgroupId=$GROUP_ID -Dpackaging=$PACKAGING -Dversion=$version -Dtransitive=false${NC}\n"

  #Running mvn dependency:get
  mvn dependency:get -DartifactId=$ARTIFACT_ID -DgroupId=$GROUP_ID -Dpackaging=$PACKAGING -Dversion=$version -Dtransitive=false

  echo -e "\nrunning : ${YELLOW}unzip $hpi_path -d $EXTRACTED_DIR${NC}\n"
  
  #Extracting the hpi
  unzip $hpi_path -d $EXTRACTED_DIR
}

# download_and_extract for VERSION_ONE
download_and_extract $VERSION_ONE

# Fetch the dependencies for VERSION_ONE
ls $EXTRACTED_DIR/WEB-INF/lib > version_one_dependency.txt
# Fetch the manifest for VERSION_ONE
cat $EXTRACTED_DIR/META-INF/MANIFEST.MF > version_one_plugin_dependency.txt

# Cleanup
rm -rf $EXTRACTED_DIR

# download_and_extract for VERSION_TWO
download_and_extract $VERSION_TWO

# Fetch the dependencies for VERSION_TWO
ls $EXTRACTED_DIR/WEB-INF/lib > version_two_dependency.txt
# Fetch the manifest for VERSION_ONE
cat $EXTRACTED_DIR/META-INF/MANIFEST.MF > version_two_plugin_dependency.txt

# Cleanup
rm -rf $EXTRACTED_DIR

# Print the output


printf "\n\n\n"

echo -e ${CYAN}$VERSION_ONE" ${YELLOW}dependency:${NC}"
cat version_one_dependency.txt

printf "\n\n"

echo -e ${CYAN}$VERSION_TWO" ${YELLOW}dependency:${NC}"
cat version_two_dependency.txt

printf "\n\n\n"

echo -e ${CYAN}$VERSION_ONE" ${YELLOW}manifest:\n${NC}"
cat version_one_plugin_dependency.txt

printf "\n\n"

echo -e ""${CYAN}$VERSION_TWO" ${YELLOW}manifest:\n${NC}"
cat version_two_plugin_dependency.txt





# Generate diff and convert to HTML for dependency
diff -u version_one_dependency.txt version_two_dependency.txt > diff_dependency.txt | diff2html -i file -- diff_dependency.txt > diff__dependency.html

# Generate diff and convert to HTML for plugin dependency
diff -u version_one_plugin_dependency.txt version_two_plugin_dependency.txt > plugin_diff_dependency.txt | diff2html -i file -- plugin_diff_dependency.txt > plugin_diff__dependency.html


rm diff__dependency.html diff_dependency.txt plugin_diff__dependency.html plugin_diff_dependency.txt version_two_dependency.txt version_one_plugin_dependency.txt version_one_dependency.txt version_two_plugin_dependency.txt



