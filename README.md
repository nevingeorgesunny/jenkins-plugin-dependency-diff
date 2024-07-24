# Jenkins Plugin Dependency List


This script helps to compare dependencies and plugin dependencies between two versions of a Jenkins plugin. It extracts the dependencies listed in the `WEB-INF/lib` directory and the plugin dependencies from the `META-INF/MANIFEST.MF` file of each version.

## Usage

To run the script, use the following command:

```bash
./list_dependency.sh <group_id> <artifact_id> <old_version> <new_version>
```

### Arguments

- `<group_id>`: The group ID of the Maven artifact.
- `<artifact_id>`: The artifact ID of the Maven artifact.
- `<old_version>`: The old version of the artifact to compare.
- `<new_version>`: The new version of the artifact to compare.

### What It Does

- Downloads the HPI file for a Jenkins plugin with this command `mvn dependency:get -DartifactId=DartifactId -DgroupId=DgroupId -Dpackaging=hpi -Dversion=version -Dtransitive=false`
- Unzips the `HPI` file with this command `unzip $HOME/.m2/repository/path/to/artifact/version/artifact.hpi -d extracted`
- Copies the content of `META-INF/MANIFEST.MF` (this contains all the plugin dependencies)
- Copies the list of a the file names of `/WEB-INF/lib` (this contains all the direct and transitive dependencies)

> **Note:** The script does not perform a diff of the dependencies. It only lists them. You will need to compare the lists manually.



### Example

```bash
./list_dependency.sh org.jenkins-ci.plugins support-core 1449.v261d6f7b_f9f3 1459.va_f527ce9a_d64
```

### Example Output

<img width="1016" alt="image" src="https://github.com/user-attachments/assets/0df8193e-caba-40a9-9012-ab81fbf80306">

## To view the diff (optional Step)
the script also creates a html diff using diff2html. To use diff2html, you need Node.js installed on your system. If diff2html is not installed, the script will just throw a warning. You will need to do the diff on your own

### how to do this on mac

```bash
brew install node
npm install diff2html
npm install diff2html-cli
```

here is how the diff will look 
<img width="1216" alt="image" src="https://github.com/user-attachments/assets/f90ebb44-3ca2-450c-aa6a-4ca75b1ef623">



