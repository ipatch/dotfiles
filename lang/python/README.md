## Contets
- [Working with Python](#working-with-python)
- [Working with pyenv](#working-with-pyenv)
- [Useful Links](#useful-links)
- [TODOs](#todos)

<a href="working-with-python"></a>

## Working with Python

To syntax check a python script / file

```python
python -m py_compile [mr_fancy_python_script]
```

<a href="working-with-pyenv"></a>

## Working with `pyenv`

To list available Python versions that can be installed.

```fish
pyenv install -l
```

To download and keep the source for a particular python and put build output to STDOUT

```fish
pyenv install -kv
```

> The source for a particular Python is downloaded in `$PYENV_ROOT/sources/[MAJOR.MINOR.PATCH]/Python-[MAJOR.MINOR.PATCH]

To install Python 2.7.15 on Debian Stretch 9.4 using **pyenv** make certain that linuxbrew pythons **ARE NOT** in the users `$PATH` when using pyenv to install a particular version of python.

<a href="useful-links"></a>

## Useful Links

<a href="todos"></a>

## TODOs
