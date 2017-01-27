# rigolo

> Deploying a Golo project on CleverCloud

## Create a Golo project (maven version)

```shell
golo new rigolo --type maven
```

## Update the pom file

### Add dependencies

- I will use [SparkJava](http://sparkjava.com/)
  - `slf4j-simple`
  - `spark-core`
- Golo needs `json-simple` (you won't need to declare it with the next milestone of Golo)
  - currently, I'm using version `3.2.0-M5` of Golo

```xml
<dependency>
  <groupId>org.slf4j</groupId>
  <artifactId>slf4j-simple</artifactId>
  <version>1.7.21</version>
</dependency>

<dependency>
  <groupId>com.sparkjava</groupId>
  <artifactId>spark-core</artifactId>
  <version>2.5</version>
</dependency>

<dependency>
  <groupId>com.googlecode.json-simple</groupId>
  <artifactId>json-simple</artifactId>
  <version>1.1.1</version>
</dependency>
```

### Change/set the version of Golo if needed

> ⚠️ When using a -SNAPSHOT version of Golo you may have issues resolving artifacts from public repositories.

```xml
<properties>
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  <golo.version>3.2.0-M5</golo.version>
</properties>
```

### Prepare your project to be deployed on Clever ☁️

- add a `clevercloud` directory
- inside `clevercloud` directory, add a `jar.json` file:
  ```json
  {
    "build": {
      "type": "maven",
      "goal": "package"
    },
    "deploy": {
      "jarName": "target/rigolo-0.0.1-SNAPSHOT-jar-with-dependencies.jar"
    }
  }
  ```
  *change values if needed*

Now you can publish your project on :octocat:

## On the Clever ☁️ side

- create an application from your repository
- choose the kind of application: `Java + JAR`
- your application has to listen on port `8080` (you'll reach it on the port `80` with your browser)

That's all

See it in action:

- http://rigolo.cleverapps.io/hello
- http://rigolo.cleverapps.io
