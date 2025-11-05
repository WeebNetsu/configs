#! /bin/bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

# write cava config
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 40

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" > $config_file

# read stdout from cava
cava -p $config_file | while read -r line; do
    echo $line | sed $dict
done




# #!/bin/bash
# levels=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

# while read -r line < /tmp/cava_fifo; do
#     output=""
#     for val in $line; do
#         index=$(awk -v v=$val 'BEGIN{idx=int(v*7); if(idx>7) idx=7; print idx}')
#         output+="${levels[$index]}"
#     done
#     echo "$output"
# done



#!/bin/bash
# ~/.config/polybar/cava.sh

# Characters representing levels
# levels=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

# # Grab one line from cava (for older versions)
# line=$(timeout 0.1 cava | head -n 1)

# # Convert numbers to characters
# for val in $line; do
#     # Normalize the value to 0-7
#     index=$(awk -v v=$val 'BEGIN{print int(v*7)}')
#     # Limit index
#     if (( index > 7 )); then index=7; fi
#     echo -n "${levels[$index]}"
# done

# echo ""



# #!/bin/bash
# cava | while read line; do
#     # Transform the line into something Polybar can display
#     # e.g., replace numbers with blocks
#     echo "$line" | awk '{for(i=1;i<=NF;i++) printf "▇"; print ""}'
# done

