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

# 处理README.md
rm new_cpp_project.sh
line=`grep -n "分割线" README.md |cut -f1 -d:`
line=$(($line + 1))
tail -n +${line} README.md > new_README.md
mv new_README.md README.md
sed -i 's/项目名/'${PROJECT_NAME}'/g' README.md

sed -i 's/project(ProjectName)/project('${PROJECT_NAME}')/g' CMakeLists.txt


git add .
git commit -m "init project "${PROJECT_NAME}


