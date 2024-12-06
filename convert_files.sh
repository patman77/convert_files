#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <source_folder> <destination_folder> <source_format> <destination_format>"
    echo
    echo "Arguments:"
    echo "  <source_folder>       The folder containing the source files (e.g., /path/to/source)."
    echo "  <destination_folder>  The folder to save the converted files (e.g., /path/to/destination)."
    echo "  <source_format>       The format of the source files (e.g., png, jpg, etc.)."
    echo "  <destination_format>  The desired format of the output files (e.g., jpg, png, etc.)."
    echo
    echo "Example:"
    echo "  $0 ./input ./output png jpg"
    exit 1
}

# Display help if -h or --help is provided
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    usage
fi

# Check if all four parameters are provided
if [ "$#" -ne 4 ]; then
    echo "Error: Incorrect number of arguments."
    usage
fi

# Assign command-line arguments to variables
SOURCE_FOLDER="$1"
DESTINATION_FOLDER="$2"
SOURCE_FORMAT="$3"
DESTINATION_FORMAT="$4"

# Check if the source folder exists
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: Source folder '$SOURCE_FOLDER' does not exist."
    exit 1
fi

# Create the destination folder if it doesn't exist
mkdir -p "$DESTINATION_FOLDER"

# Convert files from source format to destination format
for file in "$SOURCE_FOLDER"/*."$SOURCE_FORMAT"; do
    if [ -f "$file" ]; then
        base_name=$(basename "$file" ."$SOURCE_FORMAT")
        output_file="$DESTINATION_FOLDER/$base_name.$DESTINATION_FORMAT"
        echo "Converting: $file -> $output_file"
        mogrify -format "$DESTINATION_FORMAT" -path "$DESTINATION_FOLDER" "$file"
    fi
done

echo "Conversion complete! Files in '$DESTINATION_FORMAT' format are saved in '$DESTINATION_FOLDER'."

