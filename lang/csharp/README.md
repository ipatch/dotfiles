
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
