#!/bin/bash

target=$(realpath "$1")
workdir=$(pwd)

out_script="$workdir"/loop.sh

printf '#!/bin/bash\n\n' > "$out_script"

printf 'input='"$target"'\n\n' >> "$out_script"
if [[ -d $target ]]; then
  printf 'for i in $(ls "$input"); do\n' >> "$out_script"
  printf '  content="$input"/"$i"\n' >> "$out_script"
elif [[ -f $target ]]; then
  printf 'for i in $(cat "$input"); do\n' >> "$out_script"
  printf '  content="$i"\n' >> "$out_script"
else
  printf 'for i in {'"$target"'}; do\n' >> "$out_script"
fi

printf '  if [[ -e "$content" ]]; then\n  \n' >> "$out_script"
printf '    echo "$content"\n' >> "$out_script"
printf '  fi\n' >> "$out_script"
echo 'done' >> "$out_script"
