<a id="contents"></a>

## Contents



### Prereqs for dotnet tooling on macOS ⌘

- **TL;DR** install the dotnet sdk on macOS using brew

```shell
brew cask install dotnet-sdk
```

> The above command implies homebrew is setup and working on macOS along with the casks tap for brew, and **only** install the `dotnet-sdk` cask an **no** other, and the `dotnet-sdk` provides all the tooling for dotnet on macOS, and if another dotnet cask is installed complications will arise.


## Compiling a csharp, _C#_ program on macOS

> requires a proper directory structure to be setup

- Program.cs
- helloWorld.csproj

```shell
dotnet publish -c Release --framework netcoreapp2.1 --runtime osx-x64
```

To run the binary produced by the dotnet compiler

```shell
./bin/Release/netcoreapp2/osx-x64/helloWorld
```

## Working with .Net framework and .Net Core 3.x

Microsoft provides a analysis tool to see if a .Net Framework applicaiton can be converted to .Net Core which is compatible with Windows, Mac, and Linux.

To utilize the above mentioned tool Visual Studio 2019 should be installed on a Windows 10 machine.

```shell
choco install visualstudio2019community
```


