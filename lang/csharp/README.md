
## Compiling a csharp, C# program on macOS

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


