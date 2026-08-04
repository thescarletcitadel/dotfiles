#!/bin/bash


input=$(rofi -dmenu -p "Convert Temp (e.g., 19c, 60f):")


if [ -z "$input" ]; then
    exit 0
fi


input=$(echo "$input" | tr -d ' ' | tr '[:upper:]' '[:lower:]')


if [[ "$input" =~ ^(-?[0-9]+(\.[0-9]+)?)(c|f)$ ]]; then
    value="${BASH_REMATCH[1]}"
    unit="${BASH_REMATCH[3]}"

    if [ "$unit" == "c" ]; then
        
        result=$(echo "scale=2; ($value * 9 / 5) + 32" | bc)
        rofi -e "${value}°C  ➔  ${result}°F"
    elif [ "$unit" == "f" ]; then
        
        result=$(echo "scale=2; ($value - 32) * 5 / 9" | bc)
        rofi -e "${value}°F  ➔  ${result}°C"
    fi
else
    
    rofi -e "Invalid input! Please use a number followed by 'c' or 'f' (e.g., 19c or 60f)."
fi
