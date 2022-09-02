#!/bin/bash
# Debian System Reinstaller
# Copyright (C) 2015 Albert Huang
# Copyright (C) 2018 Andreas Fendt
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# ---
# This script assumes you are using a Debian based system
# (Debian, Mint, Ubuntu, #!), and have sudo installed. If you don't
# have sudo installed, replace "sudo" with "su -c" instead.
# 

pkgs=`dpkg --get-selections | grep -w 'install$' | cut -f 1 |  egrep -v '(dpkg|apt)'`

for pkg in $pkgs; do
    echo -e "\033[1m   * Reinstalling:\033[0m $pkg"    

    apt-get --reinstall -o Dpkg::Options::="--force-confask" -y install $pkg || {
        echo "ERROR: Reinstallation failed. See reinstall.log for details."
        exit 1
    }
done
