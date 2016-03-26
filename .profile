set -o vi
# MacPorts Installer addition on 2012-06-12_at_21:40:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export EDITOR=vim
# Use GNU coreutils by default
export PATH=/opt/local/libexec/gnubin/:$PATH

source "$HOME/.bash_aliases"

# GlassFish Server manager tools
export PATH=/Applications/NetBeans/glassfish-3.1.2.2/bin:$PATH

# Android dev tools
export PATH=/Users/$USER/dev/android-sdk/platform-tools:$PATH

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
#GAE_DIR=/Users/$USER/dev/google_appengine
#export PATH=$PATH:$GAE_DIR
#export GOROOT=$GAE_DIR/goroot
#export PATH=$PATH:$GOROOT/bin
#export GOPATH=$GAE_DIR/gopath

# Go Language (local)
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=/Users/$USER/Projects/go/ext/:/Users/$USER/Projects/go/own/
export GOPATH_INITIAL=$GOPATH
export PATH=$PATH:${GOPATH//://bin:}/bin

# Temp directory for Perforce
export TMP=/Users/$USER/.tmp/

# MySQL home
export MYSQL_HOME=/Applications/MAMP/Library/
export PATH=$PATH:/Applications/MAMP/bin/

# Git
#export PATH=/usr/local/git/bin/:$PATH

# Java
export JAVA_HOME="$(java_home)"
export JAVA_HOME7="`java_home -v 1.7`"

# Maven
export M2_HOME=/usr/local/apache-maven/current/
export M2=$M2_HOME/bin/
export PATH=$PATH:$M2

# PhantomJS
#export PHANTOMJS_BIN=/usr/local/phantomjs-1.9.7-macosx/bin/
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
export PATH=$PATH:$PHANTOMJS_BIN

# NPM
export PATH=$PATH:$HOME/local/bin/

# Inkscape - requires full path
#export PATH=$PATH:/Applications/Inkscape.app/Contents/Resources/bin/
alias inkscape='/Applications/Inkscape.app/Contents/Resources/bin/inkscape -z'

# Google Closure Compiler
export PATH=$PATH:$HOME/dev/lib/compiler-latest/

# BOTTOM - set only if not set before
if [ -z "${INITIAL_PATH}" ]
then
	export INITIAL_PATH=$PATH
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
