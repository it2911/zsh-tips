echo "Install zsh git curl"
sudo apt install zsh git curl -y

echo "Install OH-MY-ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Install font"
git clone https://github.com/powerline/fonts.git --depth=1
fonts/install.sh
rm -rf fonts
mkdir -p ~/.config/fontconfig/conf.d
tee ~/.config/fontconfig/conf.d/50-enable-terminess-powerline.conf <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <selectfont>
    <acceptfont>
      <pattern>
        <patelt name="family"><string>terminess powerline</string></patelt>
      </pattern>
    </acceptfont>
  </selectfont>
</fontconfig>
EOF
fc-cache -vf

echo "Git clone zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Git clone zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Git clone zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

echo "Edit .zshrc"
echo "Replace the theme ZSH_THEME=/"powerlevel9k/powerlevel9k/""
echo "Add zsh-autosuggestions zsh-syntax-highlighting zsh-completions to plugins part of .zshrc."
echo "Ending source .zshrc"