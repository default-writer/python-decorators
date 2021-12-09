# Visual Studio Code Playground
Python Decorators

Default template for working with Python Decorators from Visual Studio Code

# Project structure

- ./bin
  - build_requirements.txt - file with build prerequisites
  - build.sh - utility for buiding environment. uses ./env.sh internally
  - env.sh - utility for the first run. writes to ./env
  - format.sh - utility for reformatting source code using pre-commit 
  - lint.sh - utility for finding code issues. writes to ./pylint
  - test.sh - utility for running tests and code coverage. writes to ./pytest, ./coverage
  - update.sh

# Recommendations

- clone repository in container volume
- apply chmod +x for ./bin utilities
- setup environment using ./bin/env.sh utility
- update environment using ./bin/update.sh utility
- update requirements.txt if needed

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
