if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

fpath=($ZSH/zsh/functions $fpath)

autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history

# メモリ内の履歴の数
HISTSIZE=100000

# 保存される履歴の数
SAVEHIST=100000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY

# 履歴を他のシェルとリアルタイム共有
setopt SHARE_HISTORY

# 履歴ファイルに時刻を記録
setopt EXTENDED_HISTORY

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt HIST_NO_STORE

setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions

# 直前と同じコマンドラインはヒストリに追加しない
setopt HIST_IGNORE_ALL_DUPS

# 余計なスペースを排除してヒストリに追加
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

### キー操作
# おおむねEmacsっぽく
bindkey -e
# M-f/M-bの挙動をEmacsのそれに合わせる（実はM-bは元々同じ挙動なのだが一応）
bindkey "^[f" emacs-forward-word
bindkey "^[b" emacs-backward-word
# M-f/M-b/M-dなどでの単語境界の基準をEmacsライクに
export WORDCHARS=""
# M-n/M-pの挙動をtcshっぽく
bindkey "^[n" history-beginning-search-forward
bindkey "^[p" history-beginning-search-backward

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
