# Working with C++

## Contents

<a id="contents"></a>


- [General C++ Commands & Usage](#general-c++-commands-and-usage)
- [Working with Objective-C](#working-with-objective-c)
- [Useful Links](#useful-links)

## Working with CMake

<a id="working-with-cmake"></a>

To uninstall _remove_ binaries that have been installed from a **CMake** process use the `install_mainfest.txt` generated from running `make install` along with xargs to remove the binaries that were installed. [learn more][so1]

```shell
cat install_manifest.txt | xargs rm
cat install_manifest.txt | xargs -L1 dirname | xargs rmdir -p
```

[so1]: <https://stackoverflow.com/a/48914285/708807>

## General C++ Commands & Usage

<a id="general-c++-commands-and-usage"></a>

To compile a C++ ie. C plus plus program from a command line interface, ie. CLI

> The below command implies that a C++ compiler is installed on the local system.

```shell
g++ /path/to/mr-fancy-42.cpp -o /path/to/mr-fancy-42
```


## Working with Objective-C

<a id="working-with-objective-c"></a>

On macos to list available SDKs available to Xcode

```shell
xcodebuild -showsdks
```

## Useful Links

<a id="useful-links"></a>

- [**github** gist / **effective modern cmake**][lnk1]
- [**github** / cmake examples][lnk2]
- [**cgold** / the hitchhicker's guide to cmake][lnk3]
- [_blog_ paul smith, getting started with llvm backend, C api](https://www.pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html)
- [**cyberciti.biz** How To Compile And Run a C/C++ Code In Linux](https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/)

[lnk1]: <https://gist.github.com/mbinna/c61dbb39bca0e4fb7d1f73b0d66a4fd1>
[lnk2]: <https://github.com/ttroy50/cmake-examples>
[lnk3]: <https://cgold.readthedocs.io/en/latest/>

## TODOs

<a id="todos"></a>

- [ ] review [**hackaday article**][1] about valgrind

[1]: <https://hackaday.com/2020/04/29/using-valgrind-to-track-down-known-and-unknown-bugs-in-your-code/>
