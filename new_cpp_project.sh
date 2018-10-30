#!/usr/bin/env bash

# Exit if name argument is not given
if [ -z "$*" ]; then
    echo "Usage: ./new_cpp_project.sh project_name"
    exit 0
fi

PROJECT_NAME=$1


################################################################################

# Clone template repository
git clone https://github.com/Jefung/cpp_project_template.git

mv cpp_project_template ${PROJECT_NAME}

cd ${PROJECT_NAME}

rm .git -rf

git init

rm new_cpp_project.sh
rm README.md
echo "# "${PROJECT_NAME} >> README.md

git add .
git commit -m "init project "${PROJECT_NAME}


