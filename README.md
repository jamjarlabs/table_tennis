# Table Tennis 🏓

This is a table tennis game built in Godot. This is built to target the web using Web Assembly.

## Developing

Developing this requires these dependencies:

- [Godot v3.4+](https://godotengine.org/download)
- [Godot export templates v3.4+](https://godotengine.org/download) (See the [Godot docs for a guide for installing
these](https://docs.godotengine.org/en/stable/tutorials/export/exporting_projects.html#export-templates))
- [Python v3.10+](https://www.python.org/downloads/)

Any further dependencies can be installed by installing from the included `requirements.txt` file:

```bash
pip install -r requirements.txt
```

### Additional commands

There is a Makefile provided which includes some useful tools:

- `make lint` - runs [gdlint](https://github.com/Scony/godot-gdscript-toolkit/wiki/3.-Linter) against the codebase
which checks for common Godot code issues.
- `make format` - runs [gdformat](https://github.com/Scony/godot-gdscript-toolkit/wiki/4.-Formatter) against the
codebase which reformats the code to a consistent style.
- `make` - builds the project, generating a distributable zip in the `dist/` directory.
- `make run` - builds the project, then hosts it locally using Python accessible at <https://localhost:8000>

### Quick start

After installing the above dependencies you can import this project into Godot, and you can immediately start
developing using standard Godot tools.

### Continous integration

Any code must pass the linter, formatter, and be buildable to be allowed to merge. Each pull request and commit will
have these checks ran against the changes automatically.
