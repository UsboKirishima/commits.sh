#!/bin/bash
##########################################################################
#  Copyright (C) 2022 Davide Usberti (alias UsboKirishima)               #
#  This file is part of Commits.                                         #
#  Commits is free software: you can redistribute it and/or modify       #
#  it under the terms of the GNU General Public License as published by  #
#  the Free Software Foundation, either version 3 of the License, or     #
#  (at your option) any later version.                                   #
#  SaulBot is distributed in the hope that it will be useful,            #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of        #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
#  GNU General Public License for more details.                          #
#  You should have received a copy of the GNU General Public License     #
#  along with Commits.  If not, see http://www.gnu.org/licenses/         #
##########################################################################

#Auth token
TOKEN=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

#Requests cooldown (seconds)
COOLDOWN=5

#Repo URL
REPO_URL=https://github.com/xStaqed/HelloC

REPO_PATH=/tmp/commitspam

FOLDER="$( cd ${REPO_PATH} && pwd )"

FILE_PATH="${REPO_PATH}/test.txt"

COMMIT_NAME="ses"

function cloneRepo() {
  if [ "${FOLDER}" != "" ]; then
    (echo -e "[INFO] Repo found in ${REPO_PATH}, removing it")
    (rm -r ${REPO_PATH})
  fi

  (git clone ${REPO_URL} ${REPO_PATH})
  (echo -e "[INFO] Repo cloned in ${REPO_PATH}")
}

function createFile() {
  if [ -e "${FILE_PATH}" ]; then 
    (echo -e "[INFO] ${FILE_PATH} found.")
  else
    (touch ${FILE_PATH})
    (echo -e "${FILE_PATH} Not found, but created!")
  fi
}

function writeFile() {
  i=0
  while true; do
    (echo "${i}" > ${FILE_PATH})
    i = ${i+1}
    (git add .)
    (git commit -m "${COMMIT_NAME}")
    (git push)
    (sleep ${COOLDOWN})
  done
}

function main() {
  cloneRepo
  createFile
  writeFile
}

main