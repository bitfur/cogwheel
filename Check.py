import os
import subprocess
import sys
import optparse
parser = optparse.OptionParser()
parser.add_option('-e', action='store_true', dest='e', default=False,
    help = "show empty")
(options, args) = parser.parse_args()
f = open('md5.txt', 'r')
count = 0
files = {}
while True:
    count += 1
    line = f.readline()
    if not line:
        break
    file_with_path = line.strip().split("  ")[1]
    directory = os.path.dirname(file_with_path)
    filename = os.path.basename(file_with_path)
    if directory not in files:
        files[directory] = []
    files[directory].append(filename)
f.close()
print("Hashed files:{}".format(count))
for folder in files:
    hashed_files = files[folder]
    just_files = [f for f in os.listdir(folder) if os.path.isfile(os.path.join(folder,f))]
    for f in just_files:
        if f not in hashed_files:
            print("WARNING: Not hashed: {}".format(os.path.join(folder,f)))
    for f in hashed_files:
        if f not in just_files:
            print("WARNING: Actual file missing: {}".format(os.path.join(folder,f)))
            #os.system("md5add {}".format(os.path.join(folder,f)))
if options.e:
    dirs = [x[0] for x in os.walk(".")]
    for d in dirs:
        print(d)