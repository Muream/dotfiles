PANE_TITLE="secondary_pane"

# Try to find an existing pane with that title
pane_id=$(tmux list-panes -F '#{pane_id} #{pane_title}' | awk -v t="$PANE_TITLE" '$2==t {print $1}')

if [ -n "$pane_id" ]; then
  tmux select-pane -t "$pane_id"
else
  tmux split-window
  tmux select-pane -T "$PANE_TITLE"
fi
