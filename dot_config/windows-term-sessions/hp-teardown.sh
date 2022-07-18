project_dir="$HOME/projects/hp-teardown/"

cmd.exe /c "wt.exe" \
    --title editor --startingDirectory $project_dir --profile "manjaro" \; \
    split-pane --horizontal --size .25 --startingDirectory $project_dir \; \
    new-tab -p "Windows PowerShell" --startingDirectory "C:\Users\tetib\OneDrive\Documents\Teardown\mods\HP-Witchcraft-and-Wizardry" \; \
    focus-tab -t 0 \
    move-focus up
