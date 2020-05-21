#!/usr/bin/env bash

# https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1804
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Install the .NET Core SDK
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get -y install apt-transport-https
sudo apt-get update
sudo apt-get -y install dotnet-sdk-3.0

# Install the language server
git clone https://github.com/Microsoft/python-language-server.git
cd python-language-server/src/LanguageServer/Impl
dotnet publish -c Release -r linux-x64
chmod a+x $(git rev-parse --show-toplevel)/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer
