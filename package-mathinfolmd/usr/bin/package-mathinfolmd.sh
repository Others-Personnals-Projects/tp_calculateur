#!/bin/bash

echo "Mise à jour des packages depuis le serveur en cours..."
sudo apt update

installVSCode() {
  wget -O code.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
  sudo apt install code.deb
}

installTextMaker() {
  wget -O texmaker.deb https://www.xm1math.net/texmaker/assets/files/texmaker_5.1.4_ubuntu_20_04_amd64.deb
  sudo apt install code.deb
}
installLatext() {
  sudo apt-get install texlive-full
}
installTexworks() {
  sudo apt-get install texworks
}
# Téléchargement des packages qui nécessite une procedure d'installation
downloadFreenas() {
  echo "Téléchargement du Freenas en cours..."
  wget -O freenas.iso https://download.freenas.org/13.0/STABLE/U5.2/x64/TrueNAS-13.0-U5.2.iso
  echo "Allez-y trouver le fichier Iso dans votre dossier prevu pour les téléchargements"
}
downloadWordPress() {
  echo "Téléchargement du WordPress en cours..."
  wget -O WordPress.zip https://wordpress.org/latest.zip
  echo "Allez-y trouver le fichier Iso dans votre dossier prevu pour les téléchargements"
}

downloadLibreOffice() {
  echo "Téléchargement du LibreOffice en cours..."
  wget -O LibreOffice.tar.gz https://ftp.gwdg.de/pub/tdf/libreoffice/stable/7.5.4/deb/x86_64/LibreOffice_7.5.4_Linux_x86-64_deb.tar.gz
  echo "Allez-y trouver le fichier dans votre dossier prevu pour les téléchargements"
}
downloadXampp() {
  echo "Téléchargement du Xampp en cours..."
  wget -O Xampp.run https://liquidtelecom.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.0.28/xampp-linux-x64-8.0.28-0-installer.run
  echo "Allez-y trouver le fichier dans votre dossier prevu pour les téléchargements"
}

downloadNetBeans() {
  echo "Téléchargement du NetBeans en cours..."
  wget -O NetBeans.deb https://dlcdn.apache.org/netbeans/netbeans-installers/18/apache-netbeans_18-1_all.deb
  echo "Allez-y trouver le fichier dans votre dossier prevu pour les téléchargements"
}

downloadJmerise() {
  echo "Téléchargement du Jmerise en cours..."
  wget -O Jmerise.zip http://www.jfreesoft.com/JMerise/JMeriseEtudiant.zip
  echo "Allez-y trouver le fichier dans votre dossier prevu pour les téléchargements"
}

# A voir plustarddddddddddddddddddddddddddddddddddddddddd
downloadPfSence() {
  echo "Downloading archive ISO Image pfSence"
  wget -O pfsene.iso.gz https://atxfiles.netgate.com/mirror/downloads/pfSense-CE-2.6.0-RELEASE-amd64.iso.gz
  echo "Find your pfSence Image to your personal folder"
}

#Part 1 of package

# la liste des applications à proposer
software_list=(
  "firefox"
  "vim"
  "gummi"
  "gnumeric"
  "TextMaker"
  "Latext"
  "Texworks"
  "Freenas"
  "WordPress"
  "LibreOffice"
  "Xampp"
  "NetBeans"
  "Jmerise"

  "apache2"
  "iptables"
  "pfsence"
  "doxygen"
  "flex"
  "bison"
  "gcc"
  "git"
  "vscode"
  "wireshark"
  "default-jdk"
  "default-jre"
)

# Lister les app
echo "###########################################################################"
echo "  La liste des applications du package pour les etudiants de LMD: "
echo "###########################################################################"

for app in "${software_list[@]}"; do
  echo "  $app"
done

read -p "Voulez-vous installer tous les logiciels du package? (y/n) " response

if [[ $response == "y" ]]; then
  for app in "${software_list[@]}"; do
    if [[ $app = "vscode" ]]; then
      installVSCode
    elif [[ $app = "Texworks" ]]; then
      installTexworks
    elif [[ $app = "TextMaker" ]]; then
      installTextMaker
    elif [[ $app = "Freenas" ]]; then
      downloadFreenas
    elif [[ $app = "Freenas" ]]; then
      downloadWordPress
    elif [[ $app = "WordPress" ]]; then
      downloadWordPress
    elif [[ $app = "LibreOffice" ]]; then
      downloadLibreOffice
    elif [[ $app = "Xampp" ]]; then
      downloadXampp
    elif [[ $app = "NetBeans" ]]; then
      downloadNetBeans
    elif [[ $app = "Jmerise" ]]; then
      downloadJmerise
    elif [[ $app = "pfsence" ]]; then
      downloadPfSence
    else
      sudo apt install $app
    fi
  done
else
  # Dans le cas où l'utilisateur entre non
  while true; do
    # Nous allons afficher les logiciels qui ne sont pas encore installés
    echo "Logiciels que nous n'avons pas trouver dans cet ordinateur:"
    for app in "${software_list[@]}"; do
      if ! dpkg -l | grep -q "^ii $app"; then
        echo "  $app"
      fi
    done

    # Demande à l'utilisateur de selectionner les logiciels qu'il veut installer
    read -p "Sélectionner le(s) logiciel(s) à installer (écrivez comme mentionné ci-haut et en cas de plusieurs logiciels séparer les avec des espaces) : " software

    # Installation des logiciels sélectionner
    for app in $software; do
      if [[ $app = "vscode" ]]; then
        installVSCode
      elif [[ $app = "Texworks" ]]; then
        installTexworks
      elif [[ $app = "TextMaker" ]]; then
        installTextMaker
      elif [[ $app = "Freenas" ]]; then
        downloadFreenas
      elif [[ $app = "Freenas" ]]; then
        downloadWordPress
      elif [[ $app = "WordPress" ]]; then
        downloadWordPress
      elif [[ $app = "LibreOffice" ]]; then
        downloadLibreOffice
      elif [[ $app = "Xampp" ]]; then
        downloadXampp
      elif [[ $app = "NetBeans" ]]; then
        downloadNetBeans
      elif [[ $app = "Jmerise" ]]; then
        downloadJmerise
      elif [[ $app = "pfsence" ]]; then
        downloadPfSence
      else
        sudo apt install $app
      fi
    done

    # Check if the user wants to install more software
    read -p "Do you want to install more software? (y/n) " response
    if [[ $response != "y" ]]; then
      break
    fi
  done
fi

echo "Thank you for using our package"

exit 0
