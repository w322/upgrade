#!/bin/bash

# upgrade.sh - a simple script to upgrade a Debian based Linux installtion.
# Copyright (C) 2016 Larry Jordan

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

LOG=/home/larry/upgrade.log
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#limit length of log file
size=$(stat -c %s $LOG)
if [ $size -gt 30000 ]
then 
   tail -n 300 $LOG > $LOG.tmp 2>/dev/null
   rm $LOG &>/dev/null
   mv $LOG.tmp $LOG
fi

nice apt-get -qq update || exit 1
echo "=====" >> $LOG
date >> $LOG
nice apt-get -y upgrade &>>$LOG || exit 1
nice apt-get -q clean || exit 1
