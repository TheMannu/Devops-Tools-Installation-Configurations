https://github.com/DevSecOpsG/Pet-application-ci-maven.git 

mvn package

## starts ubuntu linux machine

push the file to machine usig SCP if not build on same machine

- scp -i "key.pem" /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar ec2-18-209-160-66.compute-1.amazonaws.com:/home/ubuntu/   -> run 

- sudo apt update -> run 

- ssh -i "key.pem" ubuntu@ec2-18-209-160-66.compute-1.amazonaws.com  ->  login the machine 

- sudo apt install openjdk-17-jre-headless  ->  install java 

- java -jar spring-petclinic-3.3.0-SNAPSHOT.jar --server.port=8083  ->  run 

- http://<your-server-public-ip>:8083/   ->  search in browser
 

## To stop a running program started with 
- java -jar spring-petclinic-3.3.0-SNAPSHOT.jar --server.port=8083

- ps -aux | grep spring-petclinic

- kill <PID>

- kill -9 <PID>

## Check if any java process is running

- ps -aux | grep java

## Look for the Specific Port
- You can also check if something is still running on port 8083 by using:
- sudo lsof -i :8083



---

Getting Started
Getting Started
Getting StartedFolders OWASP Markup Formatter Build Timeout Credentials Binding Timestamper Workspace Cleanup Ant Gradle Pipeline GitHub Branch Source Pipeline: GitHub Groovy Libraries Pipeline Graph View Git SSH Build Agents Matrix Authorization Strategy PAM Authentication LDAP Email Extension Mailer Dark Theme
Ionicons API
Folders
OWASP Markup Formatter
ASM API
JSON Path API
Structs
Pipeline: Step API
Token Macro
Build Timeout
bouncycastle API
Credentials
Plain Credentials
Variant
SSH Credentials
Credentials Binding
SCM API
Pipeline: API
commons-lang3 v3.x Jenkins API
Timestamper
Caffeine API
Script Security
JavaBeans Activation Framework (JAF) API
JAXB
SnakeYAML API
JSON Api
Jackson 2 API
commons-text API
Pipeline: Supporting APIs
Plugin Utilities API
Font Awesome API
Bootstrap 5 API
JQuery3 API
ECharts API
Display URL API
Checks API
JUnit
Matrix Project
Resource Disposer
Workspace Cleanup
Ant
JavaMail API
Durable Task
Pipeline: Nodes and Processes
Instance Identity
Pipeline: SCM Step
Pipeline: Groovy
Pipeline: Job
Jakarta Activation API
Jakarta Mail API
Apache HttpComponents Client 4.x API
Mailer
Pipeline: Basic Steps
Gradle
Pipeline: Milestone Step
Pipeline: Build Step
Pipeline: Groovy Libraries
Pipeline: Stage Step
Joda Time API
Pipeline: Model API
Pipeline: Declarative Extension Points API
Branch API
Pipeline: Multibranch
Pipeline: Stage Tags Metadata
Pipeline: Input Step
Pipeline: Declarative
Pipeline
Java JSON Web Token (JJWT)
OkHttp
GitHub API
Mina SSHD API :: Common
Mina SSHD API :: Core
Gson API
Git client
Git
GitHub
GitHub Branch Source
Pipeline: GitHub Groovy Libraries
Pipeline Graph Analysis
Metrics
Pipeline Graph View
Git
EDDSA API
Trilead API
SSH Build Agents
Matrix Authorization Strategy
PAM Authentication
LDAP
Email Extension
Mailer
** - required dependencyJenkins 2.452.3





