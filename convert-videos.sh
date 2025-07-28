#!/bin/bash

# Function to display usage information
usage() {
    printf "Usage: %s <input_directory> <output_directory> <output_format>\n" "$(basename "$0")"
    exit 1
}

# Function to convert a single video file
convert_video() {
    local input_file="$1"
    local output_file

    output_file="${OUTPUT_DIR}/$(basename "${input_file%.*}").${OUTPUT_FORMAT}"

    # Construct the ffmpeg command
    local cmd
    cmd="ffmpeg -i \"$input_file\" -c:v copy -c:a pcm_s16be \"$output_file\" < /dev/null"

    # Print and execute the command
    printf "Executing: %s\n" "$cmd"
    if ! eval "$cmd"; then
        printf "Error converting %s\n" "$input_file" >&2
        return 1
    fi

    printf "Successfully converted %s to %s\n" "$input_file" "$output_file"
}

# Main function to process all video files in the directory
main() {
    mkdir -p "$OUTPUT_DIR"

    local file
    while IFS= read -r -d $'\0' file; do
        if [[ -f "$file" && ( "${file##*.}" == "mp4" || "${file##*.}" == "mov" || "${file##*.}" == "avi" ) ]]; then
            printf "Processing file: %s\n" "$file"
            if ! convert_video "$file"; then
                printf "Failed to process %s\n" "$file" >&2
            fi
        fi
    done < <(find "$INPUT_DIR" -type f \( -iname '*.mp4' -o -iname '*.mov' -o -iname '*.avi' \) -print0)

    printf "All video files processed.\n"
}

# Ensure the correct number of parameters are provided
if [[ $# -ne 3 ]]; then
    usage
fi

# Assign parameters to global variables
INPUT_DIR="$1"
OUTPUT_DIR="$2"
OUTPUT_FORMAT="$3"

# Execute main function
main
