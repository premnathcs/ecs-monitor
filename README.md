# ecs-monitor #
****
ecs-monitor is a [JEE](http://en.wikipedia.org/wiki/Java_EE) application helps to track, monitor and alert the health of a system. ecs-monitor relies on Java SE 6 (internal version 1.6). 

	java -version 

***
## Getting the code ##
ecs-monitor uses [git](http://git-scm.com/) as our source control system and [https://github.com/premnathcs/ecs-monitor](https://github.com/premnathcs/ecs-monitor) as public repository. You can clone the latest code onto your local machine with the following command.

	git clone https://github.com/premnathcs/ecs-monitor.git
***

## Building the application ##
TuxWeb uses Maven ([http://maven.apache.org/](http://maven.apache.org/)) for building and packaging the project for deployment.  Please make sure you have at least Maven version 3.0.3.

	mvn --version

To build the Web Application make sure you are in the project directory and type the following command:

	mvn clean package
	
This will create a deployable WAR,

* **ecs-monitor.war**   - The web application

### <a id="build-in-eclipse-id"></a>Building in Eclipse
Since the project files are **not** checked into the source control, we need to generate them whenever the pom.xml changes, including the first time we get the project.  Either close eclipse or delete your existing projects before your run the following command.

	mvn -Dwtpversion=1.0 eclipse:clean eclipse:eclipse 

This will generate ecs-monitor project.  The ecs-monitor will be created as a WebTools Project (WTP) and can be added to any web server you have defined in Eclipse.  Tomcat7 is recommended for development environments.

****
### Deployment ###

There are several different applications used for deploying the web application depending on the environment.  For local development often Jetty is used, or sometimes Tomcat.  For our Continuous Integration Server Tomcat is used.  For Production and QA TuxWeb uses WebSphere.

