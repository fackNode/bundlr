#!/bin/bash

fmt=`tput setaf 45`
end="\e[0m\n"
err="\e[31m"
scss="\e[32m"

sudo apt-get install curl wget git jq libpq-dev libssl-dev build-essential pkg-config openssl ocl-icd-opencl-dev libopencl-clang-dev libgomp1 -y

wget https://raw.githubusercontent.com/fackNode/requirements/main/docker.sh && chmod +x docker.sh && ./docker.sh

wget https://raw.githubusercontent.com/fackNode/requirements/main/rust.sh && chmod +x rust.sh && ./rust.sh

if ! node --version; then
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt-get install nodejs -y
fi

if command -v node &>/dev/null && node -v && command -v npm &>/dev/null && npm -v; then
  echo -e "${fmt}\nNodeJs and NPM installed correctly${end}" && sleep 1

else
  echo -e "${err}\nNodeJs and NPM installed incorrectly${end}" && sleep 1
fi
