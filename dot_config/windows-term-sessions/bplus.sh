project_dir="/home/thibbs/projects/bplus-tree-vis/"

cmd.exe /c "wt.exe" \
    --title editor --startingDirectory $project_dir --profile "manjaro" \; \
    split-pane --horizontal --size .25 --startingDirectory $project_dir \; \
    new-tab --title server --startingDirectory $project_dir --profile "manjaro" \; \
    focus-tab -t 0 \; \
    move-focus up
