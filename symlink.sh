##
# You must delete all existing *zsh*, *vim* and *tmux* files and directories
# in your home folder for these new files to work
##
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.zsh-custom > /dev/null 2>&1
sudo rm -rf ~/.gemrc > /dev/null 2>&1
sudo rm -rf ~/.gitignore > /dev/null 2>&1
sudo rm -rf ~/.gitmodules > /dev/null 2>&1
sudo rm -rf ~/.gvimrc > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.viminfo > /dev/null 2>&1
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.oh-my-zsh > /dev/null 2>&1
sudo rm -rf ~/.slate > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
sudo rm -rf ~/.zsh-syntax-highlighting.zsh > /dev/null 2>&1
sudo rm -rf ~/highlighters > /dev/null 2>&1
sudo rm -rf ~/.ackrc > /dev/null 2>&1
sudo rm -rf ~/README > /dev/null 2>&1
sudo rm -rf ~/.antigen > /dev/null 2>&1
sudo rm -rf ~/.antigen.zsh > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1


# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/vim ~/.vim
ln -s ~/imt_dotfiles/vimrc ~/.vimrc
if [ "$(uname)" = "Darwin" ]; then
    ln -s ~/imt_dotfiles/tmux/mac_tmux ~/.tmux
else
    ln -s ~/imt_dotfiles/tmux/linux_tmux ~/.tmux
fi
ln -s ~/imt_dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/imt_dotfiles/ackrc ~/.ackrc
ln -s ~/imt_dotfiles/gitconfig ~/.gitconfig
ln -s ~/imt_dotfiles/config ~/.config
ln -s ~/imt_dotfiles/gemrc ~/.gemrc
ln -s ~/imt_dotfiles/psqlrc ~/.psqlrc
ln -s ~/imt_dotfiles/tigrc ~/.tigrc

# If vundle doesn't exist clone it so we can update vim plugins
if [ ! -d ~/imt_dotfiles/vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/vim/bundle/vundle
fi

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

