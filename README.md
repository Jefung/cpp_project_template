# C++项目模板
ps: 手动打字,如有错误(懒得多次检查),或者其他想法,bug欢迎在issue提出,thanks.
## 学习链接:
* cmake入门: [CMake 入门实战](http://www.hahack.com/codes/cmake/) 对应[源码](https://github.com/wzpan/cmake-demo)

## 简介
快速建立一个基本的c++项目结构,加快开发

- 目录结构
- 使用CMAKE构建
- 使用[googletest](https://github.com/google/googletest)作为单元测试框架
- 利用Doxygen生成API文档(待进一步了解)

你可以fork后改装为符合你个人习惯的模板

## 使用
1. 下载`new_cpp_project.sh`脚本,并赋予权限(windows下我个人是使用`Git Bash`去下载,不用赋予权限,可以直接执行)
    ```bash
    curl -O https://raw.githubusercontent.com/Jefung/cpp_project_template/master/new_cpp_project.sh
    chmod u+x new_cpp_project.sh
    ```
2. 使用脚本去下载C++项目模板,参数是你想创建的项目名
    ```bash
    ./new_cpp_project.sh 项目名
    ```
    比如: 我执行了`./new_cpp_project.sh test`, 就会在该目录下生成一个`test`目录,里面是c++项目模板,并帮你建立为一个新的repo

ps:
* 你输入的项目名会自动替换项目根目录下`CMakeLists.txt`第二行的`project(ProjectName)`为`project(项目名)`
* 生成的可执行文件名字为`项目名_run`(放在`cmake-build-debug/bin`下)
* 生成的库文件名字为`项目名.a`(放在`cmake-build-debug/lib`下)
* 如果你想修改c++标准(默认为c++11),在顶层`CMakeLists.txt`的`set(CMAKE_CXX_STANDARD 11)`修改

## 目录结构
* 项目根目录
    * src:
        默认入口文件是`main.cpp`,你可以在`src/CMakeLists.txt`中修改入口文件.
        当前src编译规则是单独编译`main.cpp`为`项目名_run`,将其他源文件(h/cpp)打包为`项目名.a`,
        并链接.
    * tests:
        默认编译规则是编译该目录下所有以`test_`开头的`.cpp`文件,入口文件是使用`googletest`提供的`gtest_main`入口文件.
        生成`Unit_Tests_run`可执行文件(放在`cmake-build-debug/bin`下)
    * third_lib:
        使用的第三方库文件存放目录,`googletest`测试框架就放在这,默认是构建时自动下载,没有包含在该项目内

## 配置Clion并测试使用(待完善:clion的操作截图,有空找纯洁环境配置下)
ps: 每次增加/删除文件需要手动重新加载项目才能正确编译(待解决!)
* 直接打开项目, 运行`tests/test_example.cpp`测试是否可以单元测试
* 运行`src/main.cpp`测试是否可以正常运行

## 小技巧:
* 生成目录树:
    * windows: 进入目的文件夹,执行 `tree . /F` (git-bash不可用,使用自带cmd)
    * linux: 进入目的文件夹, 执行 `tree`
-------------------------------- 分割线(以下会出现在新建项目的README.md) --------------------------------
# 项目名
## Todo
```
- [x] 以实现的功能
- [ ] 待实现的功能
```

## 目录结构
```bash
├─docs : 项目文档相关资料
│      Doxyfile
├─cmake-build-debug
│  │
│  ├─lib : 默认生成库所在目录
│  │
│  └─bin : 默认可执行文件(项目的可执行文件,单元测试的可执行文件)所在目录
│
├─src : 源代码
│      CMakeLists.txt
│      main.cpp : 入口文件
│
├─tests : 单元测试
│      CMakeLists.txt
│      common.cpp
│      common.h : 测试文件共用函数/类
│      test_example.cpp : googletest的demo,方便写测试文件时可用
│
└─third_lib : 第三方库所在目录(如googletest)
```

## 如何使用?

