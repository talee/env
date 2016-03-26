#!/bin/bash
# Mac aliases
# tac for example requires coreutils

astart(){ sudo apachectl start "$@"; }
astop(){ sudo apachectl stop "$@"; }
arestart(){ sudo apachectl restart "$@"; }
# Prints bash key bindings and commands
bash-print-bindings() { bind -p;  }
ba(){ . ~/Projects/misc/env/.bash_aliases "$@"; }
bo(){ bower "$@"; }
bu(){ bower up "$@"; }
bi(){ bower i "$@"; }
C(){ c "$@"; }
#alias c='g++ -Wall'
g++d(){ g++ -Wall -g -O0 "$@"; }
chrome-blank(){ /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --user-data-dir=$HOME/temp/chrome > /dev/null 2>&1 --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --start-maximized "$@"; }
chrome-blank-beta(){ /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=$HOME/temp/chrome-beta > /dev/null 2>&1 --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --start-maximized "$@"; }
chrome-blank-stable(){ /Applications/Google\ Chrome\ Stable.app/Contents/MacOS/Google\ Chrome --user-data-dir=$HOME/temp/chrome-stable > /dev/null 2>&1 --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --start-maximized "$@"; }
cl(){ clear "$@"; }
clipb(){ xargs echo -n | xclip -selection clip "$@"; }
convertDates(){ awk 'system(\"date -r\" \$1)' "$@"; }
copywd(){ pwd | tr -d \\n | pbcopy "$@"; }
copypwd(){ pwd -P | tr -d \\n | pbcopy "$@"; }
cutcl(){ cut -d' ' -f2 | tr -d \"\n\" "$@"; }
cutclc(){ cutcl | pbcopy "$@"; }
curl-file(){ ccl -K "$@"; }
d(){ vim -d "$@"; }
#alias diskspace="df -h /dev/disk0s2/ | grep -C 2 '[0-9\.]\+[GM]\s\+[0-9]\+\%'"
diskspace(){ df -h | head -2 | grep -C 1 -i Gi "$@"; }
ee() { echo -e "$@"; }
# Enables holding down a key to repeat in GUI apps; disables accent menu
enablekeyrepeat(){ defaults write -g ApplePressAndHoldEnabled -bool false "$@"; }
disablekeyrepeat(){ defaults write -g ApplePressAndHoldEnabled -bool true "$@"; }
# Gets the authoritative name server for a given domain name
dns_root(){ nslookup -type=soa "$@"; }
e(){ vim "$@"; }
f(){ fg "$@"; }
findnonhidden(){ find . -type f \( ! -regex ".*/\..*" \) "$@"; }
findtextfiles(){ find . -type f -exec grep -Iq . {} \; -and -print "$@"; }
FIRE_LAZER_SYMANTEC(){ sudo killall SymAutoProtect navx "$@"; }
lsnonhidden_tree(){ find . | grep -v "\/\." | less "$@"; }
lu(){ l ../ "$@"; }
flatzip(){ zip -rj "$@"; }
g(){ grep --color=always -i "$@"; }
# Highlights name, version, description of apt-cache show. Also grep -v extras.
ga(){ grep -v "Depends\|Recommends\|MD5sum\|SHA1\|SHA256\|Description-md5\|Bugs" | grep -C 99 "Package: \w\+\|Version: .\+\|Description-\w\+: .\+" "$@"; }
gf(){ asadmin start-domain --debug=true domain1 "$@"; }
gfl(){ asadmin list-applications "$@"; }
gfu(){ asadmin undeploy "$@"; }
gfd(){ asadmin deploy "$@"; }
gfs(){ pgrep -fl felix "$@"; }
gf(){ asadmin start-domain --debug=true domain1 "$@"; }
gfstop(){ asadmin stop-domain domain1 "$@"; }
gfrestart(){ asadmin restart-domain domain1 "$@"; }
gdc(){ git dc "$@"; }
gg(){ git "$@"; }
gga() { git add "$@"; }
gbh(){ git symbolic-ref --short HEAD "$@"; }
gbr(){ gb -m `gbh` "$@"; }
ggf(){ git diff-tree --no-commit-id --name-only -r "$@"; }
ggfh(){ git diff-tree --no-commit-id --name-only -r HEAD "$@"; }
gc(){ git ch "$@"; }
gcm(){ git cm "$@"; }
gb(){
	# don't pipe to nl if command is part of a pipe
	if [ $# -gt 0 ] || [ ! -t 1 ]; then
		git br "$@";
	else
		git br | nl;
	fi
}
# Robust printing of all local refs in git
gb-shell() { git for-each-ref --format='%(refname:short)' refs/heads/; }
gbn() { gb-shell | sed -ne "$1"'{p;q}'; }
gdw(){ git dw "$@"; }
gl(){ git l "$@"; }
git-cleanf(){ git clean -f "$@"; }
git-diffprev(){ git diff HEAD@{1} "$@"; }
git-show(){ git show --name-only "$@"; }
git-view(){
	local FILENAME=`ffebui "$2"`
	git show "$1":"$FILENAME" | r -c "file .STD_IN_$FILENAME | filetype detect" -;
}
git-viewlast(){ git-view "HEAD~1" "$1"; }
git-pullrecurse(){ git submodule foreach git pull "$@"; }
gitf(){ git fetch && git st "$@"; }
gs(){ git st "$@"; }
# git status file names only
#alias gsn='git status --porcelain | cut -c4-'
gsn(){ git status --porcelain | cut -c4- "$@"; }
gu(){ gulp "$@"; }
gpg(){ gpg2 "$@"; }
grave(){ echo -n '\`' | clipb "$@"; }
gr(){ grep -irn "$@"; }
grb(){ gr -I --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=.svn --exclude-dir=build --exclude-dir=gradleBuild --exclude-dir=exploded --exclude="*.map" "$@"; }
grbl(){ grb --exclude-dir=logs "$@"; }
grep(){ `which grep` --color=always "$@"; }
grepi(){ grep -i --color=always "$@"; }
grepnc(){ grep --color=none "$@"; }
grepTimes(){ grep --color=none -o "\[Time [0-9]\{10\}" | grep -o --color=none "[0-9]\{10\}" "$@"; }
godocServer(){ godoc -http=:6060 & open http://localhost:6060/pkg/ "$@"; }
chrome-debug(){ /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=remote-profile "$@"; }
gv(){ mvim "$@"; }
h(){ htop "$@"; }
h1() { head -1 "$@"; }
hgcommitted(){ hg st --change -1 "$@"; }
iojs(){ ~/Downloads/iojs-v2.2.1-darwin-x64/bin/iojs "$@"; }
is(){ sudo iftop -i wlan0 -B "$@"; }
jdump(){ jconsole -pluginpath ~/Utilities/tda-bin-2.2/tda.jar "$@"; }
jfind(){ java -jar $HOME/Utilities/jarscan/jarscan.jar "$@"; }
ju(){ java org.junit.runner.JUnitCore "$@"; }
lc(){ ls -F -C1 "$@"; }
less(){ `which less` -FSRX "$@"; }
ll(){ ls -alF "$@"; }
la(){ ls -ACF "$@"; }
l(){ ls -CF "$@"; }
lh(){ ls -gohF "$@"; }
# List hidden files with their sizes
lha(){ ls -agohF "$@"; }
loginTimes(){ syslog -F raw -k Facility com.apple.system.lastlog | grep $USER | grep -v tty "$@"; }
# List directories only
lsd(){ l | grep --color=none '.*/' "$@"; }
mysql_local(){ mysql --host=localhost -uroot -p "$@"; }
# Prints out a bunch of local network devices and highlights device names
#alias networknames='sudo nmap -sU --script nbstat.nse -p137 10.0.0.1-12 | grep -B 9 "NetBIOS name: \w\+"'
networknames(){ ~/Projects/local-netbios-awk/getNetBIOS.sh "$@"; }
nn(){ npm "$@"; }
ni(){ npm i "$@"; }
nrm(){ npm rm "$@"; }
nu(){ npm up "$@"; }
npmlist(){ npm list --depth 0 "$@"; }
p(){ python "$@"; }
p4ch(){ p4p | tail -1 | cut -d" " -f2 "$@"; }
p4-ch-delete(){ p4 change -d "$@"; }
p4-cwd(){ p4 where ./ | sed 's/ \/\/.*$//' "$@"; }
p4-describe(){ p4 describe -S -s "$@"; }
# Usage: p4-log 2 build.xml
p4-log(){ p4 changes -s submitted -l -m "$@"; }
p4-movetoch(){ p4 reopen -c "$@"; }
p4client(){ p4 client -o | g "^Client:" | cut -f2 "$@"; }
p4root(){ p4 client -o | g "^Root:" | cut -f2 "$@"; }
p4p(){ p4-pending-all | tac "$@"; }
poe(){ v ~/Projects/misc/env/.profile && . ~/Projects/misc/env/.profile "$@"; }
pgl(){ pgrep -fl "$@"; }
psgrep(){ ps -ef | grep -v grep | grep -E "$@"; }
psgrepnc(){ ps -ef | grep -v grep | grepnc -E "$@"; }
pserve(){ python -m SimpleHTTPServer "$@"; }
sleepTimes(){ pmset -g log | grep -iE '^.{24} sleep ' "$@"; }
snt(){ sn \"s/\n\n\t/ /g\" "$@"; }
start_mysql(){ mysqld_safe & }
stop_mysql(){ mysqladmin shutdown -hlocalhost -uroot -p "$@"; }
#sudo(){ sudo  "$@"; }
unblockRecent(){ sudo chattr -i ~/.local/share/recently-used.xbel "$@"; }
u(){ cd ..; ls -CF "$@"; }
ups(){ cd -P .. "$@"; }
up(){ cd .. "$@"; }
upl(){ cd ..; ls -CF "$@"; }
upp(){ cd ../../ "$@"; }
uppp(){ cd ../../../ "$@"; }
upppp(){ cd ../../../../ "$@"; }
v(){ mvim -v "$@"; }
vs(){ v -O "$@"; }
vv(){ vim ~/.vimrc "$@"; }
vlc(){ /Applications/VLC.app/Contents/MacOS/VLC -I rc "$@"; }
o(){ open "'.'" "$@"; }
op(){ open "$@"; }
lastC(){ l -C1 -t | head -1 "$@"; }
r(){ vim -Mn "$@"; }
ro(){ vim -M "$@"; }
te(){ open -a TextEdit "$@"; }
tt(){ top -n0 -l1 "$@"; }
wakeTimes(){ pmset -g log | grep -iE '^.{24} wake ' "$@"; }
whichsym() { readlink -f `which "$@"`; }
x(){ exit "$@"; }

function print256colors() {
 ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )
}
function vx() {
	v `"$@"`
}
function upd() {
	time bu &
	time nu &
	wait && time nn run postinstall
	osascript -e 'display notification "upd done" with title "upd"'
}
function gcb () {
	if [ -n "$1" ]; then
		gc `gb-shell | sed -n -e "$1"'{p;q}'`
	else
		gb
	fi
}
function ccl() {
	curl "$@" -vsSD - > /dev/null
}
function generate_cert() {
	#!/bin/sh
	### Create ca.key, use a password phrase when asked
	### When asked 'Common Name (e.g. server FQDN or YOUR name) []:' use your hostname, i.e 'mysite.dev'
	openssl genrsa -des3 -out ca.key 2048
	openssl req -new -key ca.key -out ca.csr
	openssl x509 -req -days 730 -in ca.csr -out ca.crt -signkey ca.key

	### Create server certificate
	openssl genrsa -des3 -out server.key 2048
	openssl req -new -key server.key -out server.csr

	### Remove password from the certificate
	cp server.key server.key.org
	openssl rsa -in server.key.org -out server.key

	### Generate self-siged certificate
	openssl x509 -req -days 730 -in server.csr -signkey server.key -out server.crt
}
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
		if [ -d "$1" ]; then
			local ROOT_DIR="$1"
		else
			local ROOT_DIR=`fd "$1"`
		fi
		find -H "$ROOT_DIR" -iname "$2"
	else
		find -H . -iname "$1"
	fi
}
function ffc() {
	ff "*$1*"
}
function ffe() {
	ff "*$@"
}
function ffev() {
	v `ffe "$@"`
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
	find "$1" \( -path "*/build" -o -path "*/dist" -o -path "*/gradleBuild" \) -prune -o -iname "*$2*" -print
}
function ffbui() {
	find . ! -path "*/build/*" ! -path "*/bower_components/*" ! -path "*/node_modules/*" -iname "$@"
}
function ffebui() {
	ffbui "*$@"
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
	if [ $# = 1 ] && [ -f "$1" ]; then
		v "$1"
	else
		cd "$@" && l
	fi
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
	v ~/Projects/misc/env/.bash_aliases && ba
	update_repo ~/Projects/misc/env/
}
function wae() {
	v ~/Projects/intuit/work-env/.work_bash_aliases.env && . ~/.work_bash_aliases.env
	update_repo ~/Projects/intuit/work-env/
}
function update_repo() {
	local WD=$PWD
	cd ""$1""
	local DIFF_STAT=$(git status --porcelain)
	git commit -am "Auto commit: $DIFF_STAT"
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

function xx {
	$@ && exit
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
