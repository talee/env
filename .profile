# vi mode for editing and keymaps in bash
set -o vi
# Prevent writing to bash_history
unset HISTFILE
# MacPorts Installer addition on 2012-06-12_at_21:40:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export EDITOR=vim
# Use GNU coreutils by default
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# Use GNU findutils by default
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
# Use GNU sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# Golang executables
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Homebrew sbin
export PATH=$PATH:/usr/local/sbin

export PATH="$HOME/dev/bin/:$PATH"

# GlassFish
export GFDIR=/usr/local/glassfish-3.1.2/
# GlassFish Server manager tools
#export PATH=/Applications/NetBeans/glassfish-3.1.2.2/bin:$PATH
export PATH=$GFDIR/glassfish/bin:$PATH

# Android dev tools
#export PATH=/Users/$USER/dev/android-sdk/platform-tools:$PATH
export PATH=/Users/$USER/Library/Android/sdk/tools:$PATH
export PATH=/Users/$USER/Library/Android/sdk/platform-tools:$PATH
# Perforce
export PATH=/Applications/p4v.app/Contents/MacOS/p4v:$PATH
export PATH=/Applications/p4sandbox-config.app/Contents/Resources/:$PATH
export PATH=/Applications/p4sandbox-config.app/Contents/MacOS/:$PATH
export PATH=/Applications/p4merge.app/Contents/MacOS/:$PATH
export P4CONFIG=.p4config

# Google App Engine - comment out to stop using GAE version of go
# GAE does not support some packages from the standard lib e.g. "unsafe"
# GAE does not support CGO
# GAE often lags the main distribution by one or more major versions
# You cannot use any binary libraries (go or otherwise) in a GAE project (you need source for everything)
# goinstall is not intended for use with GAE projects
# http://stackoverflow.com/questions/7599476/what-is-the-correct-way-to-install-google-go-and-app-engine-sdk
GAE_DIR=$HOME/dev/go_appengine
export PATH=$PATH:$GAE_DIR
#export GOROOT=$GAE_DIR/goroot
#export PATH=$PATH:$GOROOT/bin
#export GOPATH=$GAE_DIR/gopath

# Google Cloud Platform tools autocomplete
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc

# Go Language (local)
#export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Projects/go/ext/:/$HOME/Projects/go/own/
export GOPATH_INITIAL=$GOPATH
export PATH=$PATH:${GOPATH//://bin:}/bin
export GO111MODULE=on

# Temp directory for Perforce
export TMP=/Users/$USER/.tmp/

# MySQL home
export MYSQL_HOME=/Applications/MAMP/Library/
export PATH=$PATH:/Applications/MAMP/bin/

# Git
#export PATH=/usr/local/git/bin/:$PATH

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH=$PATH:/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/
#export JAVA_HOME8="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
#export JAVA_HOME7="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
#export JAVA_HOME=$JAVA_HOME8

# Maven
#export M2_HOME=/usr/local/apache-maven/current/
#export M2=$M2_HOME/bin/
#export PATH=$PATH:$M2

# PhantomJS
#export PHANTOMJS_BIN=/usr/local/phantomjs-1.9.7-macosx/bin/
#export PHANTOMJS_BIN=/usr/local/bin/phantomjs
#export PATH=$PATH:$PHANTOMJS_BIN

# NPM
# export PATH=$PATH:$HOME/local/bin/
# Comment out for NVM

# Inkscape - requires full path
#export PATH=$PATH:/Applications/Inkscape.app/Contents/Resources/bin/
alias inkscape='/Applications/Inkscape.app/Contents/Resources/bin/inkscape -z'

# Google Closure Compiler
export PATH=$PATH:$HOME/dev/lib/compiler-latest/

# pip python bin e.g. eb for AWS
export PATH=$PATH:$HOME/Library/Python/2.7/bin/

# Use 5.7 for mysql over 8.0 cause SequelPro
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Flutter SDK
export PATH="$PATH:$HOME/Library/flutter/bin"

export PATH=$PATH:$HOME/bin/

# BOTTOM - set only if not set before
if [ -z "${INITIAL_PATH}" ]
then
	export INITIAL_PATH=$PATH
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#echo ~/.profile loaded >> ~/loaded
