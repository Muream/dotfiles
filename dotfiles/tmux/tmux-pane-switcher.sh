PANE_ROLE="secondary_pane"

# Try to find an existing pane with that title
pane_id=$(tmux list-panes -F '#{pane_id} #{@role}' | awk -v t="$PANE_ROLE" '$2==t {print $1}')

if [ -n "$pane_id" ]; then
  tmux select-pane -t "$pane_id"
else
  tmux split-window -l25%
  tmux set-option -p @role "$PANE_ROLE"
fi
