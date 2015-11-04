#!/bin/bash
# Mac aliases
# tac for example requires coreutils

alias astart="sudo apachectl start"
alias astop="sudo apachectl stop"
alias arestart="sudo apachectl restart"
alias ba='. ~/Dropbox/env/.bash_aliases'
alias C='c'
#alias c='g++ -Wall'
alias chrome-blank="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --user-data-dir=$HOME/temp/chrome > /dev/null 2>&1 --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --start-maximized"
alias chrome-blank-beta="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=$HOME/temp/chrome-beta > /dev/null 2>&1 --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --start-maximized"
alias chrome-blank-stable="/Applications/Google\ Chrome\ Stable.app/Contents/MacOS/Google\ Chrome --user-data-dir=$HOME/temp/chrome-stable > /dev/null 2>&1 --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --start-maximized"
alias cl='clear'
alias clipb='xargs echo -n | xclip -selection clip'
alias convertDates="awk 'system(\"date -r\" \$1)'"
alias copywd='pwd | tr -d \\n | pbcopy'
alias copypwd='pwd -P | tr -d \\n | pbcopy'
alias cutcl="cut -d' ' -f2 | tr -d \"\n\""
alias cutclc="cutcl | pbcopy"
alias d='vim -d'
#alias diskspace="df -h /dev/disk0s2/ | grep -C 2 '[0-9\.]\+[GM]\s\+[0-9]\+\%'"
alias diskspace="df -h | head -2 | grep -C 1 -i Gi"
# Enables holding down a key to repeat in GUI apps; disables accent menu
alias enablekeyrepeat="defaults write -g ApplePressAndHoldEnabled -bool false"
alias disablekeyrepeat="defaults write -g ApplePressAndHoldEnabled -bool true"
alias e='vim'
alias f='fg'
alias findnonhidden='find . -type f \( ! -regex ".*/\..*" \)'
alias findtextfiles='find . -type f -exec grep -Iq . {} \; -and -print'
alias FIRE_LAZER_SYMANTEC="sudo killall SymAutoProtect navx"
alias lsnonhidden_tree='find . | grep -v "\/\." | less'
alias lu='l ../'
alias flatzip='zip -rj'
alias g='grep --color=always -i'
# Highlights name, version, description of apt-cache show. Also grep -v extras.
alias ga='grep -v "Depends\|Recommends\|MD5sum\|SHA1\|SHA256\|Description-md5\|Bugs" | grep -C 99 "Package: \w\+\|Version: .\+\|Description-\w\+: .\+"'
alias gf='asadmin start-domain --debug=true domain1'
alias gfs='pgrep -fl felix'
alias gf='asadmin start-domain --debug=true domain1'
alias gfstop='asadmin stop-domain domain1'
alias gfrestart='asadmin restart-domain domain1'
alias gg='git'
alias git-diffprev='git diff HEAD@{1}'
alias git-show='git show --name-only'
alias git-pullrecurse='git submodule foreach git pull'
alias gitf='git fetch && git st'
alias gs='git st'
alias gu='gulp'
alias gpg='gpg2'
alias grave="echo -n '\`' | clipb"
alias gr='grep -irn'
alias grb='gr -I --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=build'
alias grep='grep --color=always'
alias grepi='grep -i --color=always'
alias grepnc='grep --color=none'
alias grepTimes='grep --color=none -o "\[Time [0-9]\{10\}" | grep -o --color=none "[0-9]\{10\}"'
alias godocServer='godoc -http=:6060 & open http://localhost:6060/pkg/'
alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=remote-profile'
alias gv='mvim'
alias h='htop'
alias hgcommitted='hg st --change -1'
alias iojs='~/Downloads/iojs-v2.2.1-darwin-x64/bin/iojs'
alias is='sudo iftop -i wlan0 -B'
alias jdump='jconsole -pluginpath ~/Utilities/tda-bin-2.2/tda.jar'
alias jfind="java -jar $HOME/Utilities/jarscan/jarscan.jar"
alias ju='java org.junit.runner.JUnitCore'
alias lc='ls -F -C1'
alias less='less -FSRX'
alias ll='ls -alF'
alias la='ls -ACF'
alias l='ls -CF'
alias lh='ls -gohF'
# List hidden files with their sizes
alias lha='ls -agohF'
alias loginTimes="syslog -F raw -k Facility com.apple.system.lastlog | grep $USER | grep -v tty"
# List directories only
alias lsd="l | grep --color=none '.*/'"
alias mysql_local="mysql --host=localhost -uroot -p"
# Prints out a bunch of local network devices and highlights device names
#alias networknames='sudo nmap -sU --script nbstat.nse -p137 10.0.0.1-12 | grep -B 9 "NetBIOS name: \w\+"'
alias networknames='~/Projects/local-netbios-awk/getNetBIOS.sh'
alias npmlist='npm list --depth 0'
alias p='python'
alias p4ch='p4p | tail -1 | cut -d" " -f2'
alias p4-ch-delete="p4 change -d"
alias p4-cwd="p4 where ./ | sed 's/ \/\/.*$//'"
alias p4-describe="p4 describe -S -s"
# Usage: p4-log 2 build.xml
alias p4-log="p4 changes -s submitted -l -m"
alias p4-movetoch="p4 reopen -c"
alias p4client='p4 client -o | g "^Client:" | cut -f2'
alias p4root='p4 client -o | g "^Root:" | cut -f2'
alias p4p="p4-pending-all | tac"
alias poe='v ~/Dropbox/env/.profile && . ~/Dropbox/env/.profile'
alias pgl="pgrep -fl"
alias psgrep='ps -ef | grep -v grep | grep -E'
alias psgrepnc='ps -ef | grep -v grep | grepnc -E'
alias pserve='python -m SimpleHTTPServer'
alias sleepTimes="pmset -g log | grep -iE '^.{24} sleep '"
alias snt="sn \"s/\n\n\t/ /g\""
alias start_mysql='mysqld_safe &'
alias stop_mysql='mysqladmin shutdown -hlocalhost -uroot -p'
alias sudo='sudo '
alias unblockRecent='sudo chattr -i ~/.local/share/recently-used.xbel'
alias u='cd ..; ls -CF'
alias ups='cd -P ..'
alias up='cd ..'
alias upl='cd ..; ls -CF'
alias upp='cd ../../'
alias uppp='cd ../../../'
alias upppp='cd ../../../../'
alias v='mvim -v'
alias vs='v -O'
alias vv='vim ~/.vimrc'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias o='open "'.'"'
alias op='open'
alias lastC='l -C1 -t | head -1'
alias r='vim -Mn'
alias ro='vim -M'
alias te='open -a TextEdit'
alias tt='top -n0 -l1'
alias wakeTimes="pmset -g log | grep -iE '^.{24} wake '"
alias x='exit'

function appendsudo() {
	sudo tee -a $1 > /dev/null
}

# Make a directory, change to it, print it
function mc() {
	mkdir -p $1
	cd $1
	pwd
}
# Change to directory and list contents
function cdl () {
	cd $1
	ls -CF
}
function findnotcontain() {
	find . -type f ! -exec grep -q "$1" {} \; -print
}
function loginTimesSome() {
	loginTimes | tail -$1 | grepTimes | convertDates
}
function grepTo() {
	local RESULTS=$(grep -rl "$@")
	echo $RESULTS
	if [ $RESULTS ]; then
		cd $(dirname $(echo -n $RESULTS | head -1))
	else
		echo "Nothing found."
	fi
}
function fd() {
	if [ $2 ]; then
		find -H "$1" -type d -iname "$2"
	else
		find -H . -type d -iname "$1"
	fi
}
function ff() {
	if [ $2 ]; then
		find -H "$1" -iname "$2"
	else
		find -H . -iname "$1"
	fi
}
function ffp() {
	find -H . -iname $@ -printf '%P\n'
}
function ft() {
	local DIR="."
	local TARGET="$2"
	if [ $2 ]; then
		DIR="$1"
	else
		TARGET="$1"
	fi
	local RESULTS=$(find -H "$DIR" -iname "$TARGET" -print -quit)
	echo $RESULTS
	if [ $RESULTS ]; then
		if [ $3 ]; then
			cd `echo "$RESULTS"`
		else
			cd $(dirname $(echo "$RESULTS"))
		fi
	else
		echo "Nothing found."
	fi
}
function git-author-rewrite() {
	git filter-branch --env-filter '
	
	OLD_EMAIL="'"$1"'"
	CORRECT_NAME="'"$2"'"
	CORRECT_EMAIL="'"$3"'"
	
	if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
	then
		export GIT_COMMITTER_NAME="$CORRECT_NAME"
		export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
	fi
	if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
	then
		export GIT_AUTHOR_NAME="$CORRECT_NAME"
		export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
	fi
	' --tag-name-filter cat -- --branches --tags
}
function gt {
	ft "$1" "$2" true
}
function va() {
	vim "$1" && git add "$1"
}
function ffb() {
	find "$1" \( -path "*/build" -o -path "*/dist" \) -prune -o -iname "*$2*" -print
}
function ffbui() {
	find . ! -path "*/build/*" ! -path "*/bower_components/*" ! -path "*/node_modules/*" -iname "$@"
}
function ffv() {
	vim `ff $@`
}
function portopen() {
	sudo lsof -sTCP:LISTEN -i:"$@"
}
function p4change() {
	p4 change `p4ch`
}
# Gets authors for some depot
# $1 filename
# $2 trailing path. "/..." for directory
function p4authors() {
	# Be aware of spaces or commands as filenames
	p4 filelog -s $(find -H .  \( -path "*/build" -o -path "*/dist" -path "*/node_modules" \) -prune -o -iname $1 -printf "$(p4 where . | cut -d' ' -f1)/%P$2 ") | cut -s -d ' ' -f9 | sed -e 's/@.*$//' -e '/^\s*$/d' | sort | uniq -c | sort -r
}
# List pending changelists for given file name
function p4pending() {
	# p4 changes -s pending -u "$P4USER" `ffb . "$1"`
	p4 changes -s pending -u "$P4USER" -c `p4filech`
}
function c() {
	cd "$@" && l
}
function cdd() {
cd `dirname $@`
}
function p4changelistOf() {
	p4 describe `p4filech $@`
}
function p4shelved() {
 p4 changes -u "$USER" -s shelved "$@" |  cut -d' ' -f2 | p4 -x- describe -S -s | grep --color=none -o "\.\.\. \/\/depot.*\|[0-9]\{6\}" | grep --color=none  -B1 "depot"
}
function p4a() {
	local CL=$(p4p | grepi "$1" | cutcl)
	local P4ARGS="-c $CL `ff $2 $3`"
	eval "p4 add $P4ARGS"
	p4-describe "$CL" | snt
}
# $1 Name of changelist or changelistnumber
# $2 Name of file to checkout
function p4e() {
	local EDIT="edit"
	local CL=$(p4p | grepi --color=none "$1" | cutcl)
	local P4ARGS="-c $CL `ff $2 $3`"
	local OUTPUT=`p4 $EDIT $P4ARGS`
	if [[ $OUTPUT == *reopen* ]]
	then
		# What was reopen for again??
		EDIT="reopen"
		eval "p4 $EDIT $P4ARGS"
		p4-describe "$CL" | snt
	else
		echo "$OUTPUT"
		p4-describe "$CL" | snt
	fi
}
# Edits otherwises adds
# Similiar p4e except always uses most recent changelist
function p4el() {
	local EDIT="edit"
	local CL=`p4ch`
	if [ $2 ]; then
		local FILE=`ff $1 $2`
	else
		local FILE=$1
	fi
	local P4ARGS="-c $CL $FILE"
	local OUTPUT=`p4 $EDIT $P4ARGS 2>&1`
	if [[ $OUTPUT =~ "reopen" ]]; then
		local EDIT="reopen"
		eval "p4 $EDIT $P4ARGS"
	elif [[ $OUTPUT =~ "not on client" ]]; then
		local EDIT="add"
		eval "p4 $EDIT $P4ARGS"
	else
		echo "$OUTPUT"
	fi
	p4 describe -s "$CL" | snt
}
# Prints p4 file changelist
function p4filech() {
	p4 fstat -Ro ...$@ | awk '{if ($2 == "change") print $3}'
}
function sn() {
	sed ":a;N;\$!ba;$@"
}
function m() {
	if [ $2 ]; then
		mv "$@"
	else
		mkdir "$@"
	fi
}
function total() {
	if [ $1 ]; then
		paste -sd+ $1 | bc
	else
		paste -sd+ | bc
	fi
}
# Requires inkscape to be aliased to the full path and -z
function convertTextToPath() {
	local TMP_FILE_NAME="convertText-tmp-pdf.pdf"
	inkscape $1 --export-text-to-path --export-pdf=$TMP_FILE_NAME && inkscape --export-plain-svg $2 $TMP_FILE_NAME
	rm $TMP_FILE_NAME
}
function bak() {
	local EXT="bak"
	if [ $2 ]; then
		local EXT=$2
	fi
	cp -r $1{,.$EXT}
	l $1*
}
# Updates git repo
function bae() {
	v ~/Dropbox/env/.bash_aliases && ba
	local WD=$PWD
	cd ~/Dropbox/env/
	git add -A
	local DIFF_STAT=$(git status --porcelain)
	git commit -m "Auto commit: $DIFF_STAT"
	read -p "Push? " should_push
	if [ "$should_push" == "y" ]
	then
		git push
	fi
	cd $WD
}
function gf4() {
	export PATH=/Applications/NetBeans/glassfish-4.0/bin:$PATH
}
function p4stash {
	CH="`p4ch`"
	p4 shelve -c $CH -f
	p4 revert -c $CH //...
}
function p4unstash {
	CH="`p4ch`"
	p4 unshelve -c $CH -s $CH
}
function p4s {
	CH="`p4ch`"
	p4 describe $@ -s $CH
}
function p4unshelve {
	p4 unshelve $2 -s $1 -c $1
}
function p4files {
	CH="`p4ch`"
	if [ $1 ]; then
		CH="$1"
	fi
	p4 opened -c $CH | cut -d"#" -f1
}
function p4diff {
	p4files | xargs -L1 p4 diff
}
function p4-pending-all() {
	p4 changes -s pending -u $USER -l -c `p4client` | snt
}
# git branch for p4
function p4b() {
	local P4BDIR=`p4bdir`
	if [ ! -d $P4BDIR ]; then
		echo "Creating $P4BDIR with current changelist as current branch"
		p4binit
		if [ ! $? = 0 ]; then
			return $?
		fi
	fi
	p4bnew $@
}
# same as p4b except it doesn't check/create the p4b directory
function p4bnew() {
	local P4BDIR=`p4bdir`
	if [ $1 ]; then
		local BRANCH_NAME=$1
	else
		local BRANCH_NAME="default"
	fi
	local BRANCH_FILE="$P4BDIR/$BRANCH_NAME"
	# RESUME: creating branches is acting weird
	if [ -f $BRANCH_FILE ]; then
		# Print all branches
		local BRANCH_CURRENT="`cat $(p4bdir)/current`"
		if [ $BRANCH_NAME = $BRANCH_CURRENT ]; then
			p4bstatall
		else
			# Otherwise switch to branch
			local BRANCH_CH="`cat $BRANCH_FILE`"
			echo $BRANCH_NAME > $P4BDIR/current
		fi
	else
		# Create new branch
		p4bnewforce $P4BDIR $BRANCH_NAME
	fi
}
# Creates new branch with latest p4 changelist
function p4bnewforce() {
	local P4BDIR=$1
	local BRANCH_NAME=$2
	echo $BRANCH_NAME > $P4BDIR/current
	p4ch > $P4BDIR/$BRANCH_NAME
	echo "Created new branch $BRANCH_NAME -> `p4ch`"
}
# Creates p4b directory for current client if the directory doesn't exist
function p4binit() {
	if [[ "`p4 client -o  2>&1`" =~ "doesn't exist" ]]; then
		echo "Not in a p4 directory. Exiting."
		return 1
	fi
	mkdir "`p4root`/.p4b/"
}
# Prints root directory of p4b
function p4bdir() {
	echo "`p4root`/.p4b/"
}
# Print changelist of given branch, or current branch if no arguments
function p4bch() {
	local P4BDIR="`p4bdir`"
	local BRANCH=$1
	if [ ! $BRANCH ]; then
		local BRANCH=current
	fi
	cat $P4BDIR/$BRANCH
}
# Prints given branch and its changelist
function p4bstat() {
	local BRANCH=$1
	if [ $2 ]; then
		local CURRENT_SEPARATOR="* "
	else
		local CURRENT_SEPARATOR="  "
	fi
	echo -e "$CURRENT_SEPARATOR`p4bch $BRANCH` $BRANCH"
}
# Prints all branches and their changelists
function p4bstatall() {
	local P4BDIR="`p4bdir`"
	local BRANCH_CURRENT="`cat $(p4bdir)/current`"
	for branch in `ls $P4BDIR -t -I current`; do
		if [ $branch = $BRANCH_CURRENT ]; then
			p4bstat $branch true | hlg
		else
			p4bstat $branch
		fi
	done
}

# User, date YYYY/MM/dd
function p4-submitted() {
	p4 changes -u $1 -s submitted -l @$2,@now
}

# Highlight stdin in green
function hlg() {
	echo -en "\x1B[32m"
	cat
	echo -en "\x1B[0m"
}

function wl() {
	grunt --gruntfile ~/Projects/intuit/https-watch-livereload/Gruntfile.js --baseConnectDir `pwd` --watchDir `pwd` "$@"
}
function wlp() {
	wl --hostname 0.0.0.0 "$@"
}

function fa() {
	local DIR=$1
	if [ $# = 1 ]; then
		find "$DIR" ! -path "$DIR"
	else
		find "$DIR" ! -path "$DIR" "${@:2}"
	fi
}

function lmd() {
	livedown start $@ --open
}

function sleepMode {
	# 0 - Old style - just goes to sleep.
	# 1 - Only Hibernate
	# 3 - Default - goes to sleep but writes RAM contents to disk just in case.
	# 5 - Only Hibernate mode but if you use secure virtual memory.
	# 7 - The Default but if you use secure virtual memory.
	sudo pmset -a hibernatemode $@
}


# ---------- END FUNCTIONS -------------------------
if [ -f "$HOME/.work_bash_aliases.env" ]
then
	source $HOME/.work_bash_aliases.env
fi
if [ -f "$HOME/.private.env" ]
then
	source $HOME/.private.env
fi
