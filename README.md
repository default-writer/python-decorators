# Visual Studio Code Playground
Python Decorators

Default template for working with Python Decorators from Visual Studio Code

To add pre-commit git pre-commit hook on tests, add hook and change it to executable

```bash
touch .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

```bash
#!/bin/sh
set -e
cd "${0%/*}"
status=$?
../../bin/test.sh
status=$?
[ $status -eq 0 ] && echo "SUCCESS" || exit 1
```

