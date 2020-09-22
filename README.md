# Java options example

The goal of this project is to sum up the differences between `_JAVA_OPTIONS`, `JAVA_TOOL_OPTIONS` and 
`JDK_JAVA_OPTIONS` regarding when they are being picked up and if you can override them on command line.


## How to test

There is a BASH script, called `run.sh`, that will set all three different environment variables . Afterwards it will
compile and start a small java application, that prints out all system properties starting with `-MY_`. 


## Results

As you can see `_JAVA_OPTIONS` and `JAVA_TOOL_OPTIONS` are being picked up when compiling the application.
`JDK_JAVA_OPTIONS` will **not** be picked up during compile time. When it comes to executing the java application `java`
picks up all three options. Please notice that you cannot override `_JAVA_OPTIONS` via command line.

```console
$ ./run.sh
Compiling... 
Picked up JAVA_TOOL_OPTIONS: -D-MY_KEY_2=DEFAULT
Picked up _JAVA_OPTIONS: -D-MY_KEY_1=DEFAULT

Starting java app 
NOTE: Picked up JDK_JAVA_OPTIONS: -D-MY_KEY_3=DEFAULT
Picked up JAVA_TOOL_OPTIONS: -D-MY_KEY_2=DEFAULT
Picked up _JAVA_OPTIONS: -D-MY_KEY_1=DEFAULT

Java app started
-MY_KEY_1 = DEFAULT
-MY_KEY_2 = OVERIDDEN
-MY_KEY_3 = OVERIDDEN

```


## Summary / TLDR;

If you want to set options for all java tools, you should prefer `JAVA_TOOL_OPTIONS` over `_JAVA_OPTIONS` as it can be
overridden via command line. If you only intend to set options for `java`, then you should use `JDK_JAVA_OPTIONS`.

|                     | Picked up by                                 | Overridable |
| :------------------ | :------------------------------------------: | :---------: |
| `_JAVA_OPTIONS`     | all java tools (`java`, `jar`, `javac`, ...) | NO          |
| `JAVA_TOOL_OPTIONS` | all java tools (`java`, `jar`, `javac`, ...) | YES         |
| `JDK_JAVA_OPTIONS`  | only by `java`                               | YES         |

