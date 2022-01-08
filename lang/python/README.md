## Python Tooling

<a id="contents"></a>

## Contets

- [Python Scripts](#python-scripts)
- [Working with Python](#working-with-python)
- [Working with pyenv](#working-with-pyenv)
- [Working with pip](#working-with-pip)
- [Useful Links](#useful-links)
- [TODOs](#todos)

<a id="python-scripts"></a>

## Python Scripts

To convert a directory of **.blend** files to **.obj** file using the script provided within this directory

```shell
for i in *.blend;
  /Applications/Blender.app/Contents/MacOS/Blender $i --background \
  --python convert_blend_to_obj.py -- $i.obj
end
```

<a id="working-with-python"></a>

## Working with Python [🔝](#contents)

To syntax check a python script / file

```python
python -m py_compile [mr_fancy_python_script]
```

## Working with virtual envs

❗️ If the root / parent directory for virtualenv directories is renamed then more than likely all virtualenvs will be broken due to hardcoded paths in the **activate** python scripts, see [this](https://aarongorka.com/blog/portable-virtualenv/) for a possible solution.

<a id="working-with-pyenv"></a>

## Working with `pyenv` [🔝](#contents)

To update the **pyenv** python version manager to the latest git master

```shell
cd $PYENV_ROOT; git pull upstream; git push origin master;
```

> The above commands are useful for updating the list of installable pythons

To list installable Python versions

```shell
pyenv install -l
```

To download and keep the source for a particular python version and print build output to `$STDOUT`

```shell
pyenv install -kv [MARJOR.MINOR.PATCH]
```

> The source for a particular Python is downloaded in `$PYENV_ROOT/sources/[MAJOR.MINOR.PATCH]/Python-[MAJOR.MINOR.PATCH]

- ❗️ **UPDATE** August 29, 2019

    When building Python on macOS that has multiple versions of Xcode installed ie. 10.1 10.2 and 10.3 complications can arise where certain command line tools are used or may not be installed for whatever reason. Try using the below command to build  a version of Python **2.7.x** or **3.7.x** using the tooling provided by Xcode

    ```shell
    env \
    SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk \
    MACOSX_DEPLOYMENT_TARGET=10.14 \
    pyenv install [MAJOR.MINOR.PATCH]
    ```

**protip** when installing a version of python on macOS `/usr/local/{sbin/bin}` should be in the `$PATH` or pyenv will fail to build python due to SSL errors.  However the opposite is true for Debian with linuxbrew installed and setup.

To install Python 2.7.15 on Debian Stretch 9.4 using **pyenv** make certain that linuxbrew pythons **ARE NOT** in the users `$PATH` when using pyenv to install a particular version of python.

To list local python versions available to pyenv

```shell
pyenv versions
```

To delete an old virtualenv setup with pyenv

```shell
pyenv uninstall neovim3
```

To set multiple python interpreters for a system / shell, edit **$HOME/.python-version** and add the versions of python you would to be accessible from a shell.

<strong>Example</strong>

```conf
2.7.15
3.7.2
```

<a id="working-with-pyenv-virtualenvs"></a>

### Working with pyenv virtualenvs

There is a plugin for **pyenv** that can be used to setup **virtualenvs** for python.

To setup a **virtualenv** of the name _py3my-virtualenv_

```shell
pyenv virtualenv 3.7.3 py3my-virtualenv
echo "to activate the virtualenv"
pyenv activate py3my-virtualenv
echo "to deactivate the virtualenv
pyenv deactivate
```

To list all available local virtualenvs on a box

```shell
pyenv versions
```

To install a Python package inside a virtualenv

```shell
pip install neovim3
echo "to upgrade the neovim3 package"
pip install --upgrade neovim
```

<a id="working-with-pip"></a>

### Working with pip

To list all top level packages that have been installed with **pip**

```shell
pip list
```

To list outdated packages that have been install via pip

```shell
pip list --outdated
```

To upgrade a package that has been installed with **pip**

```shell
pip install --upgrade [NAME_OF_PACKAGE]
pip install -U [NAME_OF_PACKAGE]
```

To list all versions of a package that can be installed via pip

```shell
pip install --no-deps [NAME_OF_PACKAGE]==x.x.x
echo "below is an example"
pip install --no-deps numpy==x.x.x
```

To install a locally downloaded copy of a package and use local paths, [learn more](https://stackoverflow.com/a/10429168/708807)

```shell
pip install -r requirements.txt --no-index --find-links file:///tmp/packages
```

To upgrade **all** outdated pip packages _copy pasta_

```shell
pip list --format freeze --outdated | sed 's/=.*//g' | xargs -n1 pip install -U
```

<a id="useful-links"></a>

## Useful Links

<a name="useful-links"></a>

- [**debugging python scripts/files using vscode][lnk1]
- https://pythondev.readthedocs.io/debug_tools.html (a good resource for debugging / tshooting c c++ projects that interopt with python)
- https://www.pythonguis.com/tutorials/pyside-creating-your-first-window/ (dencent tutorials for working with pyside)

[lnk1]: <https://code.visualstudio.com/docs/python/debugging>

<a id="todos"></a>

## TODOs [🔝](#contents)
