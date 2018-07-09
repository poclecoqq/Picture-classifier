import re
import sys

sizes = []

for arg in sys.argv:
    for size in re.findall("[0-9]{3,4}x[0-9]{3,4}", arg):
        sizes.append(size)

print(",".join(sizes))
