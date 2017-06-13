### added by homebrew install of nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

### added by Go Language:
export GOPATH=/Users/alexandro/gopath
export PATH=$PATH:$GOPATH/bin
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOROOT/bin

### added by Rust lang:
export PATH=$PATH:/Users/alexandro/.cargo/bin
export RUST_SRC_PATH=/usr/local/src/rust/src #Rust source code
export CARGO_HOME=$HOME/.cargo

eval $(ssh-agent -s)

### added for gcc C compiler.
CFLAGS='-Wall -Werror -Wextra -pedantic'

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by perlbrew:
source ~/perl5/perlbrew/etc/bashrc

# added by Anaconda
export PATH=/Users/alexandro/anaconda3/bin:$PATH

# added by cabal(Haskell, Common Architecture to Build Applications and Libraries)
export PATH="$HOME/Library/Haskell/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by Ocaml:
eval `opam config env`

# For a ipython notebook and pyspark integration
if which pyspark > /dev/null; then
	export SPARK_HOME="/usr/local/Cellar/apache-spark/1.6.2/libexec/"
	export PYSPARK_SUBMIT_ARGS="--master local[2]"
fi

# Added Ansible support:
#. ~/development/ansible/ansible/hacking/env-setup -q
#export ANSIBLE_INVENTORY=~/ansible_hosts

. ~/.profile
. ~/.bashrc
