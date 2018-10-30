# Python Tooling

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

**protip** when installing a version of python on macOS `/usr/local/{sbin/bin}` should be in the `$PATH` or pyenv will fail to build python due to SSL errors.  However the opposite is true for Debian with linuxbrew installed and setup.

To install Python 2.7.15 on Debian Stretch 9.4 using **pyenv** make certain that linuxbrew pythons **ARE NOT** in the users `$PATH` when using pyenv to install a particular version of python.

To delete an old virtualenv setup with pyenv

```shell
pyenv uninstall neovim3
```

<a id="useful-links"></a>

## Useful Links [🔝](#contents)

<a id="todos"></a>

## TODOs [🔝](#contents)
