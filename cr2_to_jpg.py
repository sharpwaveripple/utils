#!/usr/bin/env python3

import os
from PIL import Image

def convert_cr2_to_jpg(cr2_file, jpg_file):
    try:
        # Open the CR2 file
        image = Image.open(cr2_file)

        # Convert the image to RGB mode
        image_rgb = image.convert("RGB")

        # Save the converted image as JPG
        image_rgb.save(jpg_file, format="JPEG")
        print(f"Converted {cr2_file} to {jpg_file}")
    except Exception as e:
        print(f"Error converting {cr2_file}: {e}")

# Example usage
cr2_files = os.listdir("LROS CR3/")
for cr2_file in cr2_files:
    cr2_file = cr2_file.rstrip(".cr2")
    fpath = f"LROS CR3/{cr2_file}"
    outpath = f"LROS JPG/{cr2_file}.jpg"
    print(f"Copying {fpath} to {outpath}")
    convert_cr2_to_jpg(fpath, outpath)
    # convert_cr2_to_jpg("LROS CR3/Yellowhammer, Bradgate Park, October 11 Paul Anderson (3).CR2", "output.jpg")
