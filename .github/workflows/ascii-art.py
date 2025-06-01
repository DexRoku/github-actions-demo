# ascii_art.py

import pyfiglet
from datetime import datetime

ascii_output = []

# Create a header
ascii_output.append(pyfiglet.figlet_format("ASCII Art Job"))

# Add some messages
messages = [
    "Hello, world!",
    "Python is fun!",
    "ASCII art FTW!",
    "GitHub Actions rock!",
    f"Timestamp: {datetime.now()}"
]

for msg in messages:
    ascii_output.append(pyfiglet.figlet_format(msg))

# Save to file
with open("ascii_output.txt", "w") as f:
    f.writelines(ascii_output)
