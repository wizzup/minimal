#! /usr/bin/env nix-shell
#! nix-shell -i bash

# echo $REVEALJS

function get_filename {
    # https://stackoverflow.com/a/965072/1664572
    filename=$(basename -- "$1")
    filename="${filename%.*}"

    echo $filename
}

# function get_extension {
#     # https://stackoverflow.com/a/965072/1664572
#     filename=$(basename -- "$1")
#     extension="${filename##*.}"
#
#     echo $extension
# }

# default mode is offline
MODE=${1:-"offline"}
# echo "Mode: $MODE"

# remove ./out directory
function clear_output {
  OUTPUT="./out"
  rm -rf $OUTPUT
  mkdir $OUTPUT
}

# create output with revealjs-url location
function create_slide {
  echo "creating slides with $1"

  for i in $(ls ./in/*); do
    IN=$i
    OUT="./out/$(get_filename $IN).html"

    echo "$IN -> $OUT"
    pandoc $IN --output=$OUT\
           --to=revealjs --standalone\
           --variable=revealjs-url:$1\
           --variable=lang:en\
           --verbose
  done
}

# #TODO: output packing (tar, zip)
# function pack {
# }

# script entry point
case $MODE in
  "offline")
    echo INFO: Offline mode
    clear_output
    cp -rL --no-preserve=mode,ownership reveal.js out
    create_slide "./reveal.js"
    ;;
  "online")
    echo Warning: Online mode, make sure you have access to https://revealjs.com when presenting slide.
    clear_output
    create_slide "https://revealjs.com"
    ;;
  *)
    echo "Error: Unknown mode parameter : $MODE"
    echo "Usage: $0 <online>"
    exit 1
esac

echo Done, slide are at $OUTPUT
