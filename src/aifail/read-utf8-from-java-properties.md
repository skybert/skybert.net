title: Copilot cannot read UTF-8 from a Java Properties File
date: 2026-01-15
category: aifail
tags: aifail, utf-8, java, copilot


I'm speechless: Even Copilot get this all wrong. Question was:
> "Can you write utf-8 in your Java .properties file?"

And it said:
<img
  class="centered"
  src="/graphics/2026/copilot-utf8-properties.png"
  alt="Copilot wrongly answering how to read UTF-8 from a Java .properties file"
/>


Its answer has three problems:
1. The test data can be written with ISO-8859-1 encoding, so it doesn't prove that UTF-8 is working. 
2. Secondly, which is worse, it doesn't work. 
3. Lastly, it gives the impression that this used to be a problem, but is no longer, listing different Java versions and so on, adding credibility to its answer. But alas, it doesn't work. You have to recode the string, read the bytes as ISO 8859-1, and then construct a new string as UTF-8.

SMH.

Ok, let's try out what the robot suggested using a recent Java version:
```perl
$ java -version
openjdk version "25.0.1" 2025-10-21
OpenJDK Runtime Environment Homebrew (build 25.0.1)
OpenJDK 64-Bit Server VM Homebrew (build 25.0.1, mixed mode, sharing)

```

And the Copilot source code (I added the comment `// Copilot solution`:

```java
import java.io.*;
import java.util.*;

public class utf {
    public static void main(String... args) throws Exception {
        Properties props = new Properties();
        try (InputStream in = new FileInputStream("messages.properties")) {
            props.load(in); // Loads as UTF-8 from Java 9+
        }
        // Copilot solution
        System.out.println("Copilot reading UTF-8: " + props.getProperty("greeting"));
    }
}
```

Now, testing it out, shows that the AI code doesn't work at all:
```text
❯ javac utf.java &&  java utf
Copilot reading UTF-8: ð»
```

Applying a battled tested fix, acquired after some late night
debugging back in the day:

```java
        // Human solution, from experience, that works
        System.out.println(
            "Human reading UTF-8: " +
            new String(
                props.getProperty("greeting").getBytes("ISO-8859-1"),
                "UTF-8"));
```

Now, the ghost displays correctly:
```perl
❯ javac utf.java &&  java utf
Copilot reading UTF-8: ð»
Human reading UTF-8: 👻
```

Happy encoding!
