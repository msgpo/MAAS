#!/bin/bash
# MAAS
# Multiplexer Adaptive Adminstrator Solution

# Copyright (C) 2016 Aurélien DESBRIÈRES <aurelien@hackers.camp>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Configuration file

# Script to remove a software on remote machine

# Register the user identification during process
printf "\033[1;32m\nRegistering you identification during the MAAS process\033[0m%s\n"
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval "$(ssh-agent)"
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add


command_exists () {
    type "$1" &> /dev/null ;
}

# For Debian / Ubuntu / Trisquel / gNewSense and derivatives
if command_exists apt-get ; then
    sudo apt-get remove soft_remove ; exit
fi

# For Archlinux / Parabola and derivatives
if command_exists pacman ; then
    sudo pacman -R soft_remove ; exit
fi

# For Android / Cyanogen / Replicant and derivatives
if command_exists apt ; then
    sudo apt remove soft_remove ; exit
fi

# For Fedora and derivatives
if command_exists dnf ; then
    sudo dnf remove -y soft_remvove ; exit
fi

# For RedHat / CentOS and derivatives
if command_exists yum ; then
    sudo yum remove -y soft_remove ; exit
fi

# For Gentoo
if command_exists emerge ; then
    sudo emerge --remove -y soft_remove ; exit
fi

# For Sabayon
if command_exit equo ; then
    sudo equo install -y soft_remove ; exit
fi

# For FreeBSD
if command_exists pkg ; then
    sudo pkg remove -y soft_remove ; exit
fi
