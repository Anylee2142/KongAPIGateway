## Kong 2.0.2 with cassandra
- https://docs.konghq.com/2.0.x/getting-started/introduction/
- https://medium.com/@vasista/explaining-kong-plugins-key-authentication-and-rate-limiting-on-flask-api-9f922c4f051

## Pre-requisite
Docker latest     
Kong 2.0.2           
Cassandra 3.0           
Java 1.8       
Gradle 3.1         
    
## How to build
make one-go
- build jar
- build docker images
- build docker network
- run app server (starbucks) / cassandra
- run kong

## Kong Steps
1. Add a Service
2. Add a Route
3. Add a Consumer
4. Add a Key-Auth to the Service
5. Set a API Key to the Consumer
6. Execute APIs

## Test with postman collection at /src/test/java!

## Restlet API - Java Standard Edition (JSE) - Version 2.3.5

## Restlet API Framework  

    http://restlet.com/downloads/current/
    http://restlet.com/downloads/past/    
    http://restlet.com/technical-resources/restlet-framework/tutorials/2.3
    http://restlet.com/technical-resources/restlet-framework/guide/2.3/editions/jse/overview
    http://restlet.com/technical-resources/restlet-framework/javadocs/2.3/jse/api/
    
## Restlet API Books & Tools

    https://www.manning.com/books/restlet-in-action
    http://curl.haxx.se/docs/manual.html
    http://curl.haxx.se/docs/manpage.html
    http://curl.haxx.se/docs/httpscripting.html

## Restlet Studio API Designer

    https://studio.restlet.com

## Cloud9 Test End Points

    https://docs.c9.io/docs/run-an-application
    http://localhost:8080/restlet/hello
    https://design-paulnguyen.c9users.io/restlet/hello

## Gradle Build Tool
    
    https://gradle.org/
    https://gradle.org/gradle-download/

## Gradle Install via SDK MAN

    curl -s https://get.sdkman.io | bash
    sdk install gradle 3.1

## Gradle for Java

    https://gradle.org/getting-started-gradle-java
    https://www.tutorialspoint.com/gradle/gradle_build_a_java_project.htm
    
    gradle init --type=java-library

## Shadow Gradle Plugin

    https://github.com/johnrengelman/shadow
    http://imperceptiblethoughts.com/shadow
    https://kousenit.org/2016/03/14/the-shadow-knows-gradle/

## HTTP Authentication Notes

    http://mark-kirby.co.uk/2013/how-to-authenticate-apis-http-basic-vs-http-digest/
    https://en.wikipedia.org/wiki/Basic_access_authentication
    https://en.wikipedia.org/wiki/Digest_access_authentication
    https://restlet.com/technical-resources/restlet-framework/guide/2.3/extensions/oauth
    https://restlet.com/technical-resources/restlet-framework/javadocs/2.3/jse/ext/org/restlet/ext/oauth/package-summary.html 
