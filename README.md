# heic2jpg

Simple Windows batch script to convert HEIC images to JPG using ImageMagick.

## Prerequisites

Install ImageMagick 7 for Windows (64-bit):
https://imagemagick.org/archive/binaries/ImageMagick-7.1.2-13-Q16-HDRI-x64-dll.exe

During installation, make sure **"Add application directory to your system path"** is checked.

## Usage

Open a Command Prompt (or PowerShell) and run:

```
convert-heic.bat C:\path\to\photos
```

If no folder is given, it uses the current directory.

The script will:
- Recursively find all `.heic` files in the folder and subfolders
- Convert each to `.jpg` with the same name
- Skip any file that already has a `.jpg` version
