# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/home/ai/development/terraform/terragrunt/modules"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "code"; then

  new_window "files"
  # Create a vertical split with 60% for the first pane and 40% for the second
  tmux split-window -t "$session:$window.0" -h -p 30
  run_cmd "cd $session_root"

  new_window "editor"
  # Create a horizontal split with 80% for nvim and 20% for terminal
  run_cmd "cd $session_root && nvim ."

  # In the first window, select the first pane and run the default command (optional)
  select_window 1
  
  # Load Neovim in the first pane of the "editor" window

  # Optionally, you could select the second pane to start a terminal if needed.
  # select-pane -t 1  # If you want to switch to the terminal pane

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
