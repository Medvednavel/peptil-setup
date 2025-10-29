!#/bin/bash

sudo dnf install wget curl flatpak -y

yes | flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

yes | sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 

yes | sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y 
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y

sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 -y
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 -y

sudo dnf update -y

sudo dnf install steam  lutris -y

sudo dnf copr enable langdon/appimagelauncher -y
sudo dnf install appimagelauncher -y

flatpak install flathub org.onlyoffice.desktopeditors -y

flatpak install flathub org.kde.haruna -y

flatpak install flathub org.kde.krita -y 

flatpak install flathub us.zoom.Zoom -y 

flatpak install flathub org.telegram.desktop -y

flatpak install flathub space.rirusha.Cassette -y

flatpak install flathub com.microsoft.Edge -y

flatpak install flathub com.rtosta.zapzap -y

flatpak install flathub com.discordapp.Discord -y

flatpak install flathub org.kde.kdenlive -y

flatpak install flathub net.davidotek.pupgui2 -y

flatpak install flathub one.ablaze.floorp -y 

flatpak install flathub com.heroicgameslauncher.hgl -y

mkdir -p ~/Applications

wget -P ~/Applications https://installers.lmstudio.ai/linux/x64/0.3.30-2/LM-Studio-0.3.30-2-x64.AppImage
