## Working with the Java Programming Language

To build and run a Java program, ie. **HelloWorld.java** from a CLI

**Ex** _HelloWorld.java_

```java
import java.io.*;

public class HelloWorld {
  public static void main ( String[] args) 
  {
    System.out.println("Hello, Java!\n");
  }
}
```

Compile the **HelloWorld.java**

```shell
/path/to/javac /path/to/HelloWorld.java
```

> The above command should generate a Java class file in the same directory of the **HelloWorld.java** file.

To run the **HelloWorld.class** program

```shell
/path/to/java /path/to/HelloWorld
```

> Omit the **.class** extension when running a Java program from a CLI
