# vim

配置Vim开发环境，主要开发语言:

* Golang
* C/C++
* Python

# 环境依赖

* vim >= 8.0
* python3
* build-essential
* cmake
* python3-dev

## 开始

```bash
git clone https://github.com/sicojuy/vim.git ~/.vim
```

安装Vim插件
```bash
vim -c "PlugInstall"
```

安装Go插件
```bash
vim -c "GoInstallBinaries"
```

安装YouCompleteMe
```bash
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --clangd-completer --go-completer --ts-completer
```
