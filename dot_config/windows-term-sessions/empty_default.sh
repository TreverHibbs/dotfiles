project_dir="$HOME/.local/share/chezmoi"

cmd.exe /c "wt.exe" \
    --title editor --startingDirectory $project_dir \; \
    split-pane --horizontal --size .25 --startingDirectory $project_dir \; \
    new-tab --title server --startingDirectory $project_dir \; \
    focus-tab -t 0
