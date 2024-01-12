export OVERMIND_ENV=./.env.development.local
export LANG=en_US.UTF-8
# export PATH=/Users/ry/.local/bin:$PATH
# export PATH=/Users/ry/go/bin:$PATH
# export PATH=/Users/ry/.composer/vendor/bin:$PATH
# export PATH=/Users/ry/.emacs.d/bin:$PATH
# export PATH=/Users/ry/.docker/bin:$PATH
# zulu java
# export PATH="/Library/Java/JavaVirtualMachines/graalvm-community-openjdk-20.0.1+9.1/Contents/Home/bin:$PATH"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-20.jdk/Contents/Home"
# export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm-community-openjdk-20.0.1+9.1/Contents/Home"

#cljcondo (clojure)
# export PATH="/Users/ry/Projects/clone_for_build/clj-kondo:$PATH"

# >>> coursier install directory >>>
# export PATH="$PATH:/Users/ry/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

#docker build
export DOCKER_DEFAULT_PLATFORM=linux/amd64

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

alias tmuxconfig="nvim ~/.tmux.conf"
alias tmuxi="tmuxinator"

alias nvimconfig="nvim ~/.config/nvim/lua/settings.lua"

# alias emac="emacsclient -n"
alias be="bundle exec"
# gh pr create | create pull request on current repo
alias gprc="gh pr create"
# gh pr merge pr_num | merge pull request on current repo
function gprm() {
        gh pr merge $1
}

#docked rails
alias docked='docker run --rm -it -v ${PWD}:/rails -v ruby-bundle-cache:/bundle -p 3000:3000 ghcr.io/rails/cli'

alias ohmyzsh="nvim ~/.oh-my-zsh"
