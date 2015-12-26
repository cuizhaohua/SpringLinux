# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi
if [ ${TERM} == "dumb" ]; then
    return
fi


OUT=""
LOAD=$(w | sed -n 1p  | awk '{print $(NF-2), $(NF-1),$(NF-0)}')
OUT="${OUT}Load: ${LOAD} "

## getting temperature from USB termometer 
## http://www.dx.com/p/81105
##
if which temper >/dev/null; then
   TEMPER=$(temper -c)
   if echo $TEMPER | egrep -qv "Couldn't find the USB device"; then
      TEMPER=$(echo "scale=1;${TEMPER}/1" | bc)
      TEMPER="- Ambient: ${TEMPER}${CEL} "
   else
      TEMPER=""
   fi
fi

if [ -d "/sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034/" ]; then
TEMP=$(cat /sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034/temp1_input)
TEMP=$(echo "scale=1;${TEMP}/1000" | bc)  
CEL=$(awk 'BEGIN { print "\302\260C"; }')
OUT="${OUT}- Board: ${TEMP}${CEL} ${TEMPER}"
fi

# if we have a hard drive
if [ -e '/dev/sda' ]; then
   HDDTEMP=$(/usr/sbin/hddtemp /dev/sda 2>&1)
   if [ $? -eq 0 ]; then
       HDDTEMP=$(echo ${HDDTEMP} | awk '{print $NF}')
       HDDFREE=$(df -h /dev/sda1 | grep sda | awk '{ print " / " $(NF-2)}')
       if [ "${HDDFREE}" != "" ]; then
          HDDFREE="${HDDFREE}"b
       fi
       OUT="${OUT}- Drive: ${HDDTEMP}${HDDFREE} "
   fi
fi


MEMFREE=$(free | sed -n 2p | awk '{print $(NF-3)}')
MEMBUFFERS=$(free | sed -n 2p | awk '{print $(NF-1)}')
MEMCACHED=$(free | sed -n 2p | awk '{print $(NF)}')
MEM=$(echo "(${MEMFREE}+${MEMBUFFERS}+${MEMCACHED})/1024" | bc)
OUT="${OUT}- Memory: ${MEM}Mb"


echo ""
echo ${OUT}
echo ""
