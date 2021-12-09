# Visual Studio Code Playground
Python Decorators

Default template for working with Python Decorators from Visual Studio Code

# Recommendations

- clone repository in container volume
- apply chmod +x for ./bin utilities

```bash
chmod +x ./bin/build.sh
chmod +x ./bin/format.sh
chmod +x ./bin/lint.sh
chmod +x ./bin/test.sh
chmod +x ./bin/update.sh
```


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
