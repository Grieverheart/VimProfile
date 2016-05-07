@echo off
echo === Checking out vundle
git submodule update --init

echo === Linking vim directories
mklink %USERPROFILE%\_vimrc %cd%\.vimrc
mklink /D %USERPROFILE%\vimfiles %cd%\.vim\

echo === Linking tmux configuration
mklink %cd%\.tmux.conf %USERPROFILE%\_tmux.conf

echo === Vundling
gvim +BundleInstall +qall

echo === Done
