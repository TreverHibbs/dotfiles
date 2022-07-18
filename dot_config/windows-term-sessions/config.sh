project_dir="$HOME/.config"

cmd.exe /c "wt.exe" \
    --title editor --startingDirectory $project_dir --profile "manjaro" \; \
    split-pane --horizontal --size .25 --startingDirectory $project_dir \; \
    move-focus up \; \
    focus-tab -t 0
