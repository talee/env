#!/bin/bash
# Mac aliases
# tac for example requires coreutils

# Custom light Vim startup
#export LV=1

astart(){ sudo apachectl start "$@"; }
astop(){ sudo apachectl stop "$@"; }
arestart(){ sudo apachectl restart "$@"; }
# Prints bash key bindings and commands. vi mode bash shortcuts
bash-print-bindings() { bind -p;  }
ba(){ . ~/dev/env/.bash_aliases "$@"; }
bo(){ bower "$@"; }
bu(){ bower up "$@"; }
bi(){ bower i "$@"; }
bn(){ babel-node "$@"; }
C(){ c "$@"; }
alias g++=g++-6
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
curl-download() { curl -O -J "$@"; }
current_dir_name() { echo ${PWD##*/}; }
date-epoch() { date "$@" '+%s'; }
d(){ v -d "$@"; }
diffstr(){ diff <(echo "$1") <(echo "$2"); }
difffiles() { grep -Fvf "$1" "$2"; }
#alias diskspace="df -h /dev/disk0s2/ | grep -C 2 '[0-9\.]\+[GM]\s\+[0-9]\+\%'"
diskspace(){ df -h | head -2 | grep -C 1 -i Gi "$@"; }
docker() { podman "$@"; }
dk() { docker "$@"; }
docker-stop-last() {
	docker ps -l --format "{{.Names}}" | xargs -I {} docker stop {}
}
docker-shell() { docker exec -ti "$@" /bin/bash; }
ee() { echo -e "$@"; }
emulator-start() { emulator -avd `emulator -list-avds | head -1` "$@"; }
# Enables holding down a key to repeat in GUI apps; disables accent menu
enablekeyrepeat(){ defaults write -g ApplePressAndHoldEnabled -bool false "$@"; }
disablekeyrepeat(){ defaults write -g ApplePressAndHoldEnabled -bool true "$@"; }
digsimple() { dig "$@" +nostats +nocomments +nocmd;}
# Gets the authoritative name server for a given domain name
dns_root(){ nslookup -type=soa "$@"; }
e(){ v "$@"; }
f(){ fg "$@"; }
findnonhidden(){ find . -type f \( ! -regex ".*/\..*" \) "$@"; }
findtextfiles(){ find . -type f -exec grep -Iq . {} \; -and -print "$@"; }
FIRE_LAZER_SYMANTEC(){ sudo killall SymAutoProtect navx "$@"; }
livestreamer_start_at() { livestreamer --player-passthrough hls "$@" source; }
lsnonhidden_tree(){ find . | grep -v "\/\." | less "$@"; }
lu(){ l ../ "$@"; }
flatzip(){ zip -rj "$@"; }
g(){ grep --color=always -i "$@"; }
get-line() { sed "$1q;d" "$2"; }
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
gcl() { git clone "$@"; }
gdc(){ git dc "$@"; }
gdm() { git diff master "$@"; }
gg(){ git "$@"; }
ggpm() { git fetch origin master:master "$@"; }
# Sets up autocomplete with gg. Assumes git-completion.bash has been sourced.
# if zsh, don't source as it'll conflict with packaged one 
# source ~/.zsh/_git
#__git_complete gg _git
ggr(){ git reset "$@"; }
#__git_complete ggr _git_reset
ggrh1(){ ggr HEAD~ "$@"; }
ggrb() { git rebase "$@"; }
#__git_complete ggrb _git_rebase
#__git_complete ggpr _git_pull
git-ignore-rule() { git check-ignore -v "$@"; }
git-origin() { git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD) "$@"; }
ggr-origin-hard() { git reset --hard `git-origin` "$@"; }
git-remote() {
	git-origin | cut -d '/' -f 1
}
ggr-fetch-origin-hard() {
	git fetch `git-remote` `ggbh` && ggr-origin-hard
}
ggs(){ git stash "$@"; }
ggsh() { git show "$@"; }
ggsu() { git show stash@{"$1"}^3 "${@:2}"; }
ggsun() { ggsu "$@" --name-only; }
gga() { git add "$@"; }
ggan() {
	gsnn
	local FI=''
	read -p 'File index to add: ' FI
	git add `sel $FI gsno`
}
ggrn() {
	git-staged | nl
	local FI=''
	read -p 'File index to reset: ' FI
	git reset `sel $FI git-staged`
}
ggup() { git update-index --again "$@"; }
ggbh(){ git symbolic-ref --short HEAD "$@"; }
ggbr(){ gb -m `ggbh` "$@"; }
ggf(){ git diff-tree --no-commit-id --name-only -r "$@"; }
ggfh(){ git diff-tree --no-commit-id --name-only -r HEAD "$@"; }
gro() {
	local DIR=`git rev-parse --show-cdup "$@"`
	if [ "$DIR" ]; then
		cd "$DIR"
	fi
}
groo() {
	local DIR=`git rev-parse --show-cdup "$@"`
	if [ "$DIR" ]; then
		echo "$DIR"
	else
		echo "./"
	fi
}
gc(){ git ch "$@"; }
#__git_complete gc _git_checkout
gcn(){
	gsnn
	local FI=''
	read -p 'File index to checkout: ' FI
	gc `sel $FI gsno`
}
gcdd(){ git ch develop "$@"; }
gconf() { cat `git rev-parse --show-cdup "$@"`.git/config; }
gcm(){ git cm "$@"; }
gcmnv(){ git cm --no-verify "$@"; }
gcmm(){ git ch master "$@"; }
gb(){
	# don't pipe to nl if command is part of a pipe
	if [ $# -gt 0 ] || [ ! -t 1 ]; then
		git br "$@";
	else
		git br | nl;
	fi
}
#__git_complete gb _git_branch
gbg() {
	gb | nl | g "$@";
}
# Robust printing of all local refs in git
gb-shell() { git for-each-ref --format='%(refname:short)' refs/heads/; }
gbn() { gb-shell | sed -ne "$1"'{p;q}'; }
gdw(){ git dw "$@"; }
gdwn(){ gdw `gsnno "$@"`; }
gl(){ git log "$@"; }
glm(){ git log --merges "$@"; }
gla(){ gl --abbrev-commit "$@"; }
gms() { gg merge --squash "$@"; }
git-cleanf(){ git clean -f "$@"; }
git-create-branch() { git push -u origin HEAD "$@"; }
git-deletemerged() { git checkout master &&  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d; }
git-diffprev(){ git diff HEAD@{1} "$@"; }
# Use tilde on commit to compare diff
git-diffnames(){ git diff --name-status -M "$@"; }
git-staged() { git diff --name-only --cached "$@"; }
git-diffbranches() { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative "$1".."$2"; }
git-mash() { gcm --amend --no-edit "$@"; }
git-mash-push-f-no-verify() {
	git-mash --no-verify
	git push -f --no-verify
}
git-pulldev(){ git fetch origin develop:develop "$@"; }
git-pullmaster(){ git fetch upstream master:master "$@"; }
git-pullmasterm(){ git pull upstream master "$@"; }
git-pulloriginmaster(){ git fetch origin master:master "$@"; }
ggpr(){ git pull --rebase "$@"; }
git-show(){ git show --name-only "$@"; }
# -d dereferences annotated tags to show actual commit hash
git-tags() { git show-ref --tags -d "$@"; }
git-view(){
	local FILENAME=`ffebui "$2"`
	git show "$1":"$FILENAME" | r -Rc "file .STD_IN_$FILENAME | filetype detect" -;
}
git-viewlast(){ git-view "HEAD~1" "$1"; }
git-pullrecurse(){ git submodule foreach git pull "$@"; }
git-pullsubmodule-update() { git submodule update --init --recursive "$@"; }
gitf(){ git fetch && git st "$@"; }
git-path-part-remote() { 
	local REMOTE=$(git ls-remote --get-url "$@")
	echo -n ${REMOTE##*:}
}
# Get remote path with user replaced with given argument
git-get-remote-for-user() { 
	local REMOTE=$(git ls-remote --get-url)
	local BASE_URL=${REMOTE%:*}
	local PATH_PART=${REMOTE##*:}
	local USER_REMOVED_PATH_PART=${REMOTE#*/}
	echo "$BASE_URL:$@/$USER_REMOVED_PATH_PART"
}
# $1 user
# $2 user's branch on remote to checkout
git-checkout-remote-for-user() { 
	local REMOTE_URL=`git-get-remote-for-user "$1"`
	git remote add "$1" "$REMOTE_URL"
	git fetch "$1" "$2"
	git checkout -t "$1/$2"
}
gs(){ git st "$@"; }
gsu(){ git ls-files --others --exclude-standard "$@"; }
gst(){ git status -uno "$@"; }
# git status file names only
#alias gsn='git status --porcelain | cut -c4-'
# Cut/select characters from 4th character to end of line
gsn(){ git status --porcelain | cut -c4- "$@"; }
# tracked only
gsnt(){ git status --porcelain -uno | cut -c4- "$@"; }
# No porcelain for relative paths
gsno(){ git status --short | cut -c4- "$@"; }
# tracked only
gsnn(){
	if [ $1 ]; then
		sel "$@" gsnt
	else
		gsnt "$@" | nl;
	fi
}
gsnno() {
	if [ $1 ]; then
		sel "$@" gsno
	else
		gsno "$@" | nl;
	fi
}
gu(){ gulp "$@"; }
#gpg(){ gpg2 "$@"; }
grave(){ echo -n '\`' | clipb "$@"; }
gr(){ grep -irn "$@"; }
GREP_EXCLUDE_DIRS="--exclude-dir=.npm-cache --exclude-dir=bower_components --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=.svn --exclude-dir=build --exclude-dir=dist --exclude-dir=gradleBuild --exclude-dir=exploded --exclude=*.map --exclude=tags --exclude-dir=.idea --exclude-dir=target --exclude-dir=out"
grb(){ gr -I ${GREP_EXCLUDE_DIRS} "$@"; }
grbd(){ grb --exclude-dir=dist "$@"; }
grbc(){ grep -rn -I "$GREP_EXCLUDE_DIRS" "$@"; }
# Recursively grep given arguments. Has the following parameter sets:
# (phraseToSearchFor)
# (filePatternToMatch, phraseToSearchFor)
# (option, filePatternToMatch, phraseToSearchFor)
grbi(){
	if [ "$1" != '--color=none' ]; then
		local INCLUDE_PATTERN=$1
		local INDEX_SECOND_ARG=2
	else
		local OPTION_ONE="$1"
		if [ "$3" ]; then
			local INCLUDE_PATTERN=$2
			local INDEX_SECOND_ARG=3
		else
			local INCLUDE_PATTERN=""
			local INDEX_SECOND_ARG=2
		fi
	fi
	if [ "$INCLUDE_PATTERN" ]; then
		local INCLUDE_PATTERN="--include=$INCLUDE_PATTERN"
	fi
	gr $OPTION_ONE $INCLUDE_PATTERN -I ${GREP_EXCLUDE_DIRS} "${@:$INDEX_SECOND_ARG}";
}
grbnci(){ grbi --color=none "$@"; }
grbl(){ grb --exclude-dir=logs "$@"; }
grbnc() { grb --color=none "$@"; }
grbncc() { grbc --color=none "$@"; }
#grep(){ `which grep` --color=always "$@"; }
grepi(){ grep -i --color=always "$@"; }
grepnc(){ grep --color=none "$@"; }
grepTimes(){ grep --color=none -o "\[Time [0-9]\{10\}" | grep -o --color=none "[0-9]\{10\}" "$@"; }
godocServer(){ godoc -http=:6060 & open http://localhost:6060/pkg/ "$@"; }
chrome-debug(){ /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=remote-profile "$@"; }
gv(){ mvim "$@"; }
gvl() { gv "$@" -c 'call LargeFont()'; }
h(){ htop "$@"; }
shtop(){ sudo htop "$@"; }
sshnew() { ssh-keygen -t rsa -b 4096 -C "$@"; }
h1() { head -1 "$@"; }
hgcommitted(){ hg st --change -1 "$@"; }
iojs(){ ~/Downloads/iojs-v2.2.1-darwin-x64/bin/iojs "$@"; }
intellij() { open -a 'Intellij IDEA' "$@"; }
is(){ sudo iftop -i wlan0 -B "$@"; }
j7() { export JAVA_HOME=`java_home -v 1.7 "$@"`; }
j8() { export JAVA_HOME=`java_home -v 1.8 "$@"`; }
jdump(){ jconsole -pluginpath ~/Utilities/tda-bin-2.2/tda.jar "$@"; }
jfind(){ java -jar $HOME/Utilities/jarscan/jarscan.jar "$@"; }
ju(){ java org.junit.runner.JUnitCore "$@"; }
# Fixed in 9.0.3(1667)
# https://apple.stackexchange.com/questions/359723/internet-speed-getting-slower-over-time-on-mbp?rq=1
kill-pulse() { sudo kextunload /Library/Extensions/PulseSecureFirewall.kext; }
k8-sh() { kubectl run -it --rm --restart=Never busybox --image=busybox sh "$@"; }
kube-setup() {
	local POD_ENV=''
	read -p 'Pod env: ' POD_ENV
	local K8_CONFIG="--kubeconfig=$HOME/.kube/config_$POD_ENV" 
	local POD_INDEX=''
	local POD_NAMES=`kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' "$K8_CONFIG"`
	echo "$POD_NAMES" | nl
	read -p 'Pod index to SSH into: ' POD_INDEX
	POD_NAME=`echo -n "$POD_NAMES" | sele $POD_INDEX`
}
kube-ssh() {
	kube-setup
	kubectl exec -it "$POD_NAME" -- /bin/bash
	unset POD_NAME
}
kube-logs() {
	kube-setup
	kubectl logs "$POD_NAME" | less
	unset POD_NAME
}
lc(){ ls -F -C1 "$@"; }
less(){ `which less` -FSRX "$@"; }
ll(){ ls -alF "$@"; }
la(){ ls -ACF "$@"; }
lao(){ ls -ACFd "$@" .*; }
l(){ ls -CF "$@"; }
lh(){ ls -gohF "$@"; }
# List hidden files with their sizes
lha(){ ls -agohF "$@"; }
loginTimes(){ syslog -F raw -k Facility com.apple.system.lastlog | grep $USER | grep -v tty "$@"; }
# List directories only
lsd(){ l | grep --color=none '.*/' "$@"; }
mvndep() { mvn dependency:tree "$@"; }
mvneffective_settings() { mvn help:effective-settings "$@"; }
mysql_local(){ mysql --host=localhost -uroot -p "$@"; }
# Prints out a bunch of local network devices and highlights device names
#alias networknames='sudo nmap -sU --script nbstat.nse -p137 10.0.0.1-12 | grep -B 9 "NetBIOS name: \w\+"'
networknames(){ ~/Projects/local-netbios-awk/getNetBIOS.sh "$@"; }
node-debug() { node --inspect --debug-brk "$@"; }
nn(){ npm "$@"; }
ni(){ npm i "$@"; }
nrm(){ npm rm "$@"; }
ns() { npm start "$@"; }
nu(){ npm up "$@"; }
npmlist(){ npm list --depth 0 "$@"; }
py(){ python "$@"; }
p() { pwd "$@"; }
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
sel() {
	local OUTPUT=`"${@:2}"`
	echo "$OUTPUT" | sed -ne "$1{p;q}"
}
sele() {
	sed -ne "$1{p;q}"
}
csel() { echo "$oo" | sele "$@"; }
sleepTimes(){ pmset -g log | grep -iE '^.{24} sleep ' "$@"; }
snt(){ sn \"s/\n\n\t/ /g\" "$@"; }
start_mysql(){ mysqld_safe & }
stop_mysql(){ mysqladmin shutdown -hlocalhost -uroot -p "$@"; }
#sudo(){ sudo "$@"; }
unblockRecent(){ sudo chattr -i ~/.local/share/recently-used.xbel "$@"; }
u(){ cd ..; ls -CF "$@"; }
ups(){ cd -P .. "$@"; }
up(){ cd .. "$@"; }
upl(){ cd ..; ls -CF "$@"; }
upp(){ cd ../../ "$@"; }
uppp(){ cd ../../../ "$@"; }
upppp(){ cd ../../../../ "$@"; }
uz() { unzip "$@"; }
validate_yaml() { ruby -e "require 'yaml';puts YAML.load_file('$@')"; }
v(){
	if [ -z $LV ]; then
		export LV=0
	fi
	vim -v --cmd "let light_startup=$LV" "$@"
}
vp(){
	v `pbpaste`
}
vs(){ v -O "$@"; }
vv(){ v ~/.vimrc "$@"; }
vlc(){ /Applications/VLC.app/Contents/MacOS/VLC -I rc "$@"; }
o(){ open . "$@"; }
oo() { echo "$oo"; }
ov() { octave --no-gui "$@"; }
op(){ open "$@"; }
lastC(){ l -C1 -t | head -1 "$@"; }
querycsv() { csvsql --query "$1" --tables "$2" "$3"; }
r(){ v -Mn "$@"; }
ro(){ v -M "$@"; }
te(){ open -a TextEdit "$@"; }
tt(){ top -n0 -l1 "$@"; }
# Unzip first subdirectory of zip and renames it to given output dir. Requires
# GNU sed.
unzipone() {
	local ZIPFILE=$1
	local OUTDIR=$2
	if [ -z "$2" ]; then
		echo "Output dir name required as \$2."
		return
	fi
	local TMPDIR=._tmp
	local SUBDIR=`unzip -l "$ZIPFILE" | sed '4q;d' | awk '{print $4}'`
	# In case it's not just one directory
	mkdir $TMPDIR
	unzip "$ZIPFILE" -d $TMPDIR
	mv "$TMPDIR/$SUBDIR" "$OUTDIR"
	rm -rf $TMPDIR
}
wakeTimes(){ pmset -g log | grep -iE '^.{24} wake ' "$@"; }
whichsym() { readlink -f `which "$@"`; }
x(){ exit "$@"; }
xrm(){ xargs -rI {} rm -v '{}'; }
vxgs() {
	local FI=''
	if [ "$1" ]; then
		FI="$1"
	else
		gsnno
		read -p 'File index to edit: ' FI
	fi
	vx sel "$FI" gsno
}
vxin() {
	v <("$@")
}
vxgrb() {
	vx grbnc -l "$@";
}
vxsgrb() {
	vxs grbnc -l "$@";
}

function print256colors() {
 ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )
}
function vx() {
	v `"$@"`
}
function vxs() {
	vs `"$@"`
}
function vsx() {
	vs `"$@"`
}
function rx() {
	r `"$@"`
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
function cclb() {
	curl -w "@$HOME/.time-stats.txt" "$@" -vsSD -
}
function cclo() {
	echo `curl "$@" -sS`
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
# find file suffix in any given subdirectory 
function ff() {
	local ARGS='-H . -regextype posix-extended'
	if [ $# = 2 ]; then
		local DIR_ARGS="'-iregex' '."'*'"$1."'*/.*'"$2""'"
		eval find "${ARGS}" "$DIR_ARGS"
	else
		# find [args...] name of target
		find $ARGS "${@:1:$# - 1}" -iname "${@: -1}"
	fi
}
function ffc() {
	oo=$(ff "*$1*")
	echo "$oo"
}
function ffcv() {
	v `ffc "$@"`
}
function ffbcv() {
	v `ffb . "$@"`
}
function ffbcvs() {
	vs `ffb . "$@"`
}
function ffcvg() {
	gv `ffc "$@"`
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
	v "$1" && git add "$1"
}
function ffb() {
	find "$1" \( -path "*/build" -o -path "*/dist" -o -path "*/gradleBuild" -o -path "*/out" -o -path "*/target" \) -prune -o -iname "*$2*" -print
}
function ffbui() {
	find . ! -path "*/build/*" ! -path "*/bower_components/*" ! -path "*/node_modules/*" -iname "$@"
}
function ffebui() {
	ffbui "*$@"
}
function ffvs() {
	v -O `ff "$@"`
}
function ffcvs() {
	v -O `ffc "$@"`
}
function ffvss() {
	v -o `ff "$@"`
}
function ffv() {
	if [ $# = 1 ]; then
		v `ff "$1"`
	else
		v `ff "$1" "${@:2}"`
	fi
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
function cdx() {
	cd `"$@"`
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
function sm() {
	sudo m "$@"
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
function calc() {
	bc <<< "scale=5; $@";
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
	v ~/dev/env/.bash_aliases && ba
	update_repo ~/dev/env/
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
	read "should_push?Push? "
	if [ "$should_push" = "y" ]
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

# Patched livedown with process.on('SIGTERM', _ => server.stop())
function lmd() {
	livedown start "$@" --open
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
