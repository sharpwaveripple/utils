#!/usr/bin/env bash

# dist = [miniconda] | anaconda

dist=miniconda
dist_ver=latest
python_ver=3
install_path=${HOME}/bin/${dist}
update_if_exists=true
dist_file=${dist^}${python_ver}-${dist_ver}-Linux-x86_64.sh

echo "Installing ${dist_file} in ${install_path}..."

if [[ -d ${install_path} ]]; then
    echo "${dist^} already found in ${install_path}!"
    if [[ "$update_if_exists" == true ]]; then
        echo "Running conda update instead..."
        conda update -y conda
        conda update -y --all
    else
        echo "Exiting..."
    fi
else
    wget https://repo.continuum.io/${dist}/${dist_file}
    bash ${dist_file} -b -p ${HOME}/.anaconda
    source ~/.bashrc
    conda update -y conda
    conda install -y numpy scipy pandas scikit-learn scikit-learn-intelex \
      statsmodels matplotlib seaborn plotly ipython \
      isort nose pytest flake8 xlrd lxml openpyxl jedi
    rm ${dist_file}
fi

