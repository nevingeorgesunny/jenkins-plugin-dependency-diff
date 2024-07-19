# jenkins-plugin-dependency-diff


This script helps to compare dependencies and plugin dependencies between two versions of a Jenkins plugin. It extracts the dependencies listed in the `WEB-INF/lib` directory and the plugin dependencies from the `META-INF/MANIFEST.MF` file of each version.

## What It Does

- Downloads and extracts the specified old and new versions of the artifact.
- Lists the dependencies in the `WEB-INF/lib` directory for both versions.
- Extracts and prints the `META-INF/MANIFEST.MF` file for both versions.

> **Note:** The script does not perform a diff of the dependencies. It only lists them. You will need to compare the lists manually.


## Usage

To run the script, use the following command:

```bash
./dependency_diff_checker.sh <group_id> <artifact_id> <old_version> <new_version>
```

### Arguments

- `<group_id>`: The group ID of the Maven artifact.
- `<artifact_id>`: The artifact ID of the Maven artifact.
- `<old_version>`: The old version of the artifact to compare.
- `<new_version>`: The new version of the artifact to compare.

### Example

```bash
./dependency_diff_checker.sh com.example my-plugin 1.0.0 2.0.0
```
