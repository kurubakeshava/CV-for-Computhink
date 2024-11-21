@echo off
REM This script starts services and sets them to automatic and restarts on failure
 
set services=("Contentverse Advanced Document Service" "Contentverse Advanced Excel viewer" "Contentverse Advanced PDF viewer" "Contentverse Advanced Word viewer" "TextExtractorService")
 
for %%S in %services% do (
    echo Starting %%S
    sc start %%S
    sc config %%S start= auto
    sc failure %%S reset= 0 actions= restart/60000/restart/60000/restart/60000
)
 
echo All services started and recovery options set.
pause
 