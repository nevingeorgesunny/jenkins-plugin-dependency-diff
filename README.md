# jenkins-plugin-dependency-list


This script helps to compare dependencies and plugin dependencies between two versions of a Jenkins plugin. It extracts the dependencies listed in the `WEB-INF/lib` directory and the plugin dependencies from the `META-INF/MANIFEST.MF` file of each version.

## What It Does

- Downloads and extracts the specified old and new versions of the artifact.
- Lists the dependencies in the `WEB-INF/lib` directory for both versions.
- Extracts and prints the `META-INF/MANIFEST.MF` file for both versions.

> **Note:** The script does not perform a diff of the dependencies. It only lists them. You will need to compare the lists manually.


## Usage

To run the script, use the following command:

```bash
./list_dependency.sh.sh <group_id> <artifact_id> <old_version> <new_version>
```

### Arguments

- `<group_id>`: The group ID of the Maven artifact.
- `<artifact_id>`: The artifact ID of the Maven artifact.
- `<old_version>`: The old version of the artifact to compare.
- `<new_version>`: The new version of the artifact to compare.

### Example

```bash
./list_dependency.sh org.jenkins-ci.plugins support-core 1449.v261d6f7b_f9f3 1459.va_f527ce9a_d64
```

### Example Output

```bash
running : mvn dependency:get -DartifactId=support-core -DgroupId=org.jenkins-ci.plugins -Dpackaging=hpi -Dversion=1449.v261d6f7b_f9f3 -Dtransitive=false

[INFO] Scanning for projects...
[INFO]
[INFO] ------------------< org.apache.maven:standalone-pom >-------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] --------------------------------[ pom ]---------------------------------
[INFO]
[INFO] --- dependency:3.7.0:get (default-cli) @ standalone-pom ---
[INFO] Resolving org.jenkins-ci.plugins:support-core:hpi:1449.v261d6f7b_f9f3
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  0.400 s
[INFO] Finished at: 2024-07-19T19:08:15+05:30
[INFO] ------------------------------------------------------------------------

running : unzip /Users/nsunny/.m2/repository/org/jenkins-ci/plugins/support-core/1449.v261d6f7b_f9f3/support-core-1449.v261d6f7b_f9f3.hpi -d extracted

Archive:  /Users/nsunny/.m2/repository/org/jenkins-ci/plugins/support-core/1449.v261d6f7b_f9f3/support-core-1449.v261d6f7b_f9f3.hpi
   creating: extracted/META-INF/
  inflating: extracted/META-INF/MANIFEST.MF
   creating: extracted/WEB-INF/
   creating: extracted/WEB-INF/lib/
   creating: extracted/images/
   creating: extracted/META-INF/maven/
   creating: extracted/META-INF/maven/org.jenkins-ci.plugins/
   creating: extracted/META-INF/maven/org.jenkins-ci.plugins/support-core/
  inflating: extracted/WEB-INF/lib/jsr250-api-1.0.jar
  inflating: extracted/WEB-INF/lib/quality-check-1.3.jar
  inflating: extracted/WEB-INF/lib/support-core.jar
  inflating: extracted/WEB-INF/lib/support-log-formatter-1.2.jar
  inflating: extracted/WEB-INF/lib/uadetector-core-0.9.22.jar
  inflating: extracted/WEB-INF/lib/uadetector-resources-2014.10.jar
  inflating: extracted/WEB-INF/lib/wordnet-random-name-1.5.jar
  inflating: extracted/WEB-INF/licenses.xml
  inflating: extracted/images/support.svg
  inflating: extracted/META-INF/maven/org.jenkins-ci.plugins/support-core/pom.xml
  inflating: extracted/META-INF/maven/org.jenkins-ci.plugins/support-core/pom.properties

running : mvn dependency:get -DartifactId=support-core -DgroupId=org.jenkins-ci.plugins -Dpackaging=hpi -Dversion=1459.va_f527ce9a_d64 -Dtransitive=false

[INFO] Scanning for projects...
[INFO]
[INFO] ------------------< org.apache.maven:standalone-pom >-------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] --------------------------------[ pom ]---------------------------------
[INFO]
[INFO] --- dependency:3.7.0:get (default-cli) @ standalone-pom ---
[INFO] Resolving org.jenkins-ci.plugins:support-core:hpi:1459.va_f527ce9a_d64
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  0.301 s
[INFO] Finished at: 2024-07-19T19:08:16+05:30
[INFO] ------------------------------------------------------------------------

running : unzip /Users/nsunny/.m2/repository/org/jenkins-ci/plugins/support-core/1459.va_f527ce9a_d64/support-core-1459.va_f527ce9a_d64.hpi -d extracted

Archive:  /Users/nsunny/.m2/repository/org/jenkins-ci/plugins/support-core/1459.va_f527ce9a_d64/support-core-1459.va_f527ce9a_d64.hpi
   creating: extracted/META-INF/
  inflating: extracted/META-INF/MANIFEST.MF
   creating: extracted/WEB-INF/
   creating: extracted/WEB-INF/lib/
   creating: extracted/images/
   creating: extracted/META-INF/maven/
   creating: extracted/META-INF/maven/org.jenkins-ci.plugins/
   creating: extracted/META-INF/maven/org.jenkins-ci.plugins/support-core/
  inflating: extracted/WEB-INF/lib/jsr250-api-1.0.jar
  inflating: extracted/WEB-INF/lib/quality-check-1.3.jar
  inflating: extracted/WEB-INF/lib/support-core.jar
  inflating: extracted/WEB-INF/lib/support-log-formatter-1.2.jar
  inflating: extracted/WEB-INF/lib/uadetector-core-0.9.22.jar
  inflating: extracted/WEB-INF/lib/uadetector-resources-2014.10.jar
  inflating: extracted/WEB-INF/lib/wordnet-random-name-1.6.jar
  inflating: extracted/WEB-INF/licenses.xml
  inflating: extracted/images/support.svg
  inflating: extracted/META-INF/maven/org.jenkins-ci.plugins/support-core/pom.xml
  inflating: extracted/META-INF/maven/org.jenkins-ci.plugins/support-core/pom.properties



1449.v261d6f7b_f9f3 dependency:
jsr250-api-1.0.jar
quality-check-1.3.jar
support-core.jar
support-log-formatter-1.2.jar
uadetector-core-0.9.22.jar
uadetector-resources-2014.10.jar
wordnet-random-name-1.5.jar


1459.va_f527ce9a_d64 dependency:
jsr250-api-1.0.jar
quality-check-1.3.jar
support-core.jar
support-log-formatter-1.2.jar
uadetector-core-0.9.22.jar
uadetector-resources-2014.10.jar
wordnet-random-name-1.6.jar



1449.v261d6f7b_f9f3 manifest:

Manifest-Version: 1.0
Created-By: Maven Archiver 3.6.0
Build-Jdk-Spec: 17
Specification-Title: Support Core Plugin
Specification-Version: 0.0
Implementation-Title: Support Core Plugin
Implementation-Version: 1449.v261d6f7b_f9f3
Plugin-Class: com.cloudbees.jenkins.support.SupportPlugin
Group-Id: org.jenkins-ci.plugins
Artifact-Id: support-core
Short-Name: support-core
Long-Name: Support Core Plugin
Url: https://github.com/jenkinsci/support-core-plugin
Plugin-Version: 1449.v261d6f7b_f9f3
Hudson-Version: 2.440.3
Jenkins-Version: 2.440.3
Plugin-Dependencies: configuration-as-code:1775.v810dc950b_514;resolutio
 n:=optional,credentials:1319.v7eb_51b_3a_c97b_,metrics:4.2.21-449.v6960
 d7c54c69,structs:337.v1b_04ea_4df7c8
Plugin-Developers: Stephen Connolly:stephenconnolly:,Steven Christou:chr
 ist66:
Plugin-License-Name: The MIT license
Plugin-License-Url: https://opensource.org/licenses/MIT
Plugin-ScmConnection: scm:git:https://github.com/jenkinsci/support-core-
 plugin.git
Plugin-ScmTag: 261d6f7bf9f3421a7b4179b01a849665d65b4030
Plugin-ScmUrl: https://github.com/jenkinsci/support-core-plugin
Plugin-GitHash: 261d6f7bf9f3421a7b4179b01a849665d65b4030
Implementation-Build: 261d6f7bf9f3421a7b4179b01a849665d65b4030



1459.va_f527ce9a_d64 manifest:

Manifest-Version: 1.0
Created-By: Maven Archiver 3.6.0
Build-Jdk-Spec: 17
Specification-Title: Support Core Plugin
Specification-Version: 0.0
Implementation-Title: Support Core Plugin
Implementation-Version: 1459.va_f527ce9a_d64
Plugin-Class: com.cloudbees.jenkins.support.SupportPlugin
Group-Id: org.jenkins-ci.plugins
Artifact-Id: support-core
Short-Name: support-core
Long-Name: Support Core Plugin
Url: https://github.com/jenkinsci/support-core-plugin
Plugin-Version: 1459.va_f527ce9a_d64
Hudson-Version: 2.440.3
Jenkins-Version: 2.440.3
Plugin-Dependencies: configuration-as-code:1810.v9b_c30a_249a_4c;resolut
 ion:=optional,credentials:1344.v5a_3f65a_1e173,metrics:4.2.21-451.vd51d
 f8df52ec,structs:338.v848422169819
Plugin-Developers: Stephen Connolly:stephenconnolly:,Steven Christou:chr
 ist66:
Plugin-License-Name: The MIT license
Plugin-License-Url: https://opensource.org/licenses/MIT
Plugin-ScmConnection: scm:git:https://github.com/jenkinsci/support-core-
 plugin.git
Plugin-ScmTag: af527ce9ad64e2b15b72f98e4a4a7e29e9a1b36e
Plugin-ScmUrl: https://github.com/jenkinsci/support-core-plugin
Plugin-GitHash: af527ce9ad64e2b15b72f98e4a4a7e29e9a1b36e
Implementation-Build: af527ce9ad64e2b15b72f98e4a4a7e29e9a1b36e

```
### under dependency 
- will list out all direct and transitive dependencies

### under manifest 
- will list out all the direct and trasitive plugin dependencies



