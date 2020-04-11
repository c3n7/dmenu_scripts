#!/bin/bash
choices=(no yes)
currentgpu=$(glxinfo | grep "OpenGL vendor string" | gawk '{print $4}')
if [ $currentgpu = "Intel" ]
then
    choice=$(for choice in ${choices[*]}; do echo $choice; done | dmenu -nf '#99AABB' -nb '#001122' -sb '#004499' -sf '#EEEEEE' -fn 'monospace-10' -p 'switch to nvidia:' -i)
    if [ $choice = yes ]
    then
        optimus-manager --switch nvidia --no-confirm
    fi
elif [ $currentgpu = "NVIDIA" ]
then
    choice=$(for choice in ${choices[*]}; do echo $choice; done | dmenu -nf '#99AABB' -nb '#001122' -sb '#004499' -sf '#EEEEEE' -fn 'monospace-10' -p 'switch to intel:' -i)
    if [ $choice = yes ]
    then
        optimus-manager --switch intel --no-confirm
    fi
fi
