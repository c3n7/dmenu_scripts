#!/bin/bash
gpus=(intel nvidia)
choices=(no yes)
graphics=$(for gpu in ${gpus[*]}; do echo $gpu; done | dmenu -nf '#99AABB' -nb '#001122' -sb '#004499' -sf '#EEEEEE' -fn 'monospace-10' -p 'gpu:' -i)
if [ $graphics = "intel" ]
then
    choice=$(for choice in ${choices[*]}; do echo $choice; done | dmenu -nf '#99AABB' -nb '#001122' -sb '#004499' -sf '#EEEEEE' -fn 'monospace-10' -p 'sure?' -i)
    if [ $choice = yes ]
    then
        optimus-manager --switch intel --no-confirm
    fi
elif [ $graphics = "nvidia" ]
then
    choice=$(for choice in ${choices[*]}; do echo $choice; done | dmenu -nf '#99AABB' -nb '#001122' -sb '#004499' -sf '#EEEEEE' -fn 'monospace-10' -p 'sure?' -i)
    if [ $choice = yes ]
    then
        optimus-manager --switch nvidia --no-confirm
    fi
fi
