# Working with C++

<a id="contents"></a>

## Contents

- [General C++ Commands & Usage](#general-c++-commands-and-usage)
- [Working with Objective-C](#working-with-objective-c)
- [Useful Links](#useful-links)

<a id="working-with-cmake"></a>

## Working with CMake

To uninstall _remove_ binaries that have been installed from a **CMake** process use the `install_mainfest.txt` generated from running `make install` along with xargs to remove the binaries that were installed.

```shell
xargx rm < install_mainfest.txt
```

<a id="general-c++-commands-and-usage"></a>

## General C++ Commands & Usage

To compile a C++ ie. C plus plus program from a command line interface, ie. CLI

> The below command implies that a C++ compiler is installed on the local system.

```shell
g++ /path/to/mr-fancy-42.cpp -o /path/to/mr-fancy-42
```

<a id="working-with-objective-c"></a>

## Working with Objective-C

On macos to list available SDKs available to Xcode

```shell
xcodebuild -showsdks
```


<a id="useful-links"></a>

## Useful Links

- [**cyberciti.biz** How To Compile And Run a C/C++ Code In Linux](https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/)
