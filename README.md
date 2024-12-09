# resolve-video-converter-script
Script to convert any unsuported codec video for Blackmagicdesign Davinci Resolve Unix machines

This script converts all `.mp4` and `.mov` video files in a specified input directory to a specified output format using `ffmpeg`. The converted files are saved in a specified output directory.

![alt Convertion example](https://github.com/pablotoledom/resolve-video-converter-script/blob/main/assets/converter.gif?raw=true)

## Usage

```bash
./convert-videos.sh <input_directory> <output_directory> <output_format>
```

### Parameters
  - `<input_directory>`: The directory containing the video files to be converted.
  - `<output_directory>`: The directory where the converted video files will be saved.
  - `<output_format>`: The desired output format for the converted video files (e.g., mov).


## Example
```bash
./convert-videos.sh /path/to/input /path/to/output mov
```

This command will convert all .mp4 and .mov files in /path/to/input to .mov format and save the converted files in /path/to/output.

## Requirements

### Convertion software
  `ffmpeg` must be installed on your system. You can install it using:

```bash
# Debian based systems
sudo apt-get install ffmpeg
```

or

```bash
# MacOS based System
brew install ffmpeg
```

or

```bash
# Arch / Manjaro based System
sudo pacman -S ffmpeg
```

### Excecution permissions

```bash
chmod +x convert-videos.sh
```

## Install
Run install.sh, this script copies 'convert-videos.sh' to the /usr/local/bin/ directory.

```bash
./install.sh
```

## Script Details

#### The script performs the following steps:

  - Creates the output directory if it doesn't exist.
  - Finds all .mp4 and .mov files in the input directory.
  - Converts each found video file to the specified output format using ffmpeg.
  - Prints the ffmpeg command being executed and the status of each conversion.

#### Error Handling

  - If the conversion of any file fails, an error message is printed to stderr, and the script continues processing the remaining files.

### License

This script is released under the GNU GENERAL PUBLIC LICENSE.

### Author
Pablo Toledo