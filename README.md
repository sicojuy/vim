vim
===

依赖
--------

* vim >= 8.0
* python3
* python3-dev
* build-essential
* cmake
* ripgrep

Mac
```bash
brew install cmake python vim ripgrep
```

Ubuntu
```bash
sudo apt install cmake python3-dev build-essential vim-nox ripgrep
```

开始
----

```bash
git clone https://github.com/sicojuy/vim.git ~/.vim
```

安装Vim插件
```bash
vim -c "PlugInstall"
```

安装Go二进制文件
```bash
vim -c "GoInstallBinaries"
```

安装YouCompleteMe
```bash
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer --go-completer --ts-completer
```
