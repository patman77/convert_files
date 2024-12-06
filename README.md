# convert_files
Converts files in one directory to files saved to another directory (e.g. png's to jpg's)

Usage: convert_files.sh <source_folder> <destination_folder> <source_format> <destination_format>

Arguments:
  <source_folder>       The folder containing the source files (e.g., /path/to/source).
  <destination_folder>  The folder to save the converted files (e.g., /path/to/destination).
  <source_format>       The format of the source files (e.g., png, jpg, etc.).
  <destination_format>  The desired format of the output files (e.g., jpg, png, etc.).

Example:
  convert_files.sh ./input ./output png jpg
