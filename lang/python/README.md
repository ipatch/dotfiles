## Python Tooling

<a id="contents"></a>

## Contets

- [Working with Python](#working-with-python)
- [Working with pyenv](#working-with-pyenv)
- [Useful Links](#useful-links)
- [TODOs](#todos)

<a id="working-with-python"></a>

## Working with Python [🔝](#contents)

To syntax check a python script / file

```python
python -m py_compile [mr_fancy_python_script]
```

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
    env SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk MACOSX_DEPLOYMENT_TARGET=10.14 pyenv install [MAJOR.MINOR.PATCH]
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
pip
```

To upgrade a package that has been installed with **pip**

```shell
pip install --upgrade [NAME_OF_PACKAGE]
```

<a id="useful-links"></a>

## Useful Links

<a id="todos"></a>

## TODOs [🔝](#contents)
