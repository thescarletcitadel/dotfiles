#!/bin/bash

# Arguments: $1 = direction (grow/shrink), $2 = axis (width/height), $3 = amount
DIR=$1
AXIS=$2
AMOUNT=$3

# Calculate the move amount (half of the resize amount)
MOVE=$((AMOUNT / 2))

if [ "$DIR" == "grow" ]; then
    # Resize
    i3-msg "resize $DIR $AXIS $AMOUNT px"
    
    # Move opposite direction
    if [ "$AXIS" == "width" ]; then
        i3-msg "move left $MOVE px"
    elif [ "$AXIS" == "height" ]; then
        i3-msg "move up $MOVE px"
    fi
elif [ "$DIR" == "shrink" ]; then
    # Resize
    i3-msg "resize $DIR $AXIS $AMOUNT px"
    
    # Move opposite direction
    if [ "$AXIS" == "width" ]; then
        i3-msg "move right $MOVE px"
    elif [ "$AXIS" == "height" ]; then
        i3-msg "move down $MOVE px"
    fi
fi
