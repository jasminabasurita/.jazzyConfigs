ln -s ~/.jazzyConfigs/eslintrc ~/.eslintrc
ln -s ~/.jazzyConfigs/prettierrc ~/.prettierrc
ln -s ~/.jazzyConfigs/psqlrc ~/.psqlrc
ln -s ~/.jazzyConfigs/stylelintrc ~/.stylelintrc

# .config folder

ln -s ~/.jazzyConfigs/kitty ~/.config/kitty
ln -s ~/.jazzyConfigs/fontconfig ~/.config/fontconfig

# Install Scripts

sudo pacman -S pkgfile zsh-syntax-highlighting
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm ~/.zshrc
ln -s ~/.jazzyConfigs/zshrc ~/.zshrc
