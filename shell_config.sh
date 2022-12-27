# Customize the terminal prompt
function parse_git_branch() {
	local branch=$(git branch 2> /dev/null | grep -e '^*' | cut -d ' ' -f 2)
	local result=' '
	if [[ -n $branch ]]; then
		result=" ($branch)"
	fi
	echo $result
}
setopt PROMPT_SUBST
export PROMPT='%B%F{22}%2~%f%b%F{196}$(parse_git_branch)%f$ '
#export PROMPT='%F{226}%n%f %B%F{22}%2~%f%b%F{196}$(parse_git_branch)%f$ '

# Add colors for listed files
export CLICOLOR=1
export LSCOLORS=exgxdxfxcxegedabagacad

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Add executables
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
export PATH="~/.local/bin:$PATH"
