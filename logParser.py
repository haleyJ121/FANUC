# logParser is a utility that uses regex and enables statistical analysis to be performed on a log file generated by a FANUC R30iB+ (source code here: https://github.com/haleyJ121/FANUC) that has been FTP'd over to a local machine for this processing to occur.
# Author: Josh Haley (github @HaleyJ121)
# development date: 04/09/2020
# revision: 1

import re

log_file_path = r"H:\FANUC\KAREL\logfile"

lineIterator = 0
sensorIterator = 0
count = 0

with open (log_file_path, "r") as file:
	print ("filename: ", file.name)
	print ("read/write privleges: ", file.mode)

	result = file.readlines()

# **REGEX LINE NUMBER IDENTIFIER**
scan_lineNum = '/\n/g'
# **REGEX PROBE POSITION IDENTIFIER**
scan_probePosition ='/(?<=PROBE POSITION: )\d/g'
# **REGEX ACTIVE SENSOR IDENTIFIER**
scan_activeSensor = '/(?<=ACTIVE SENSOR: )\d/g'
# **REGEX SENSOR READOUT IDENTIFIER**
scan_sensorReadout = '/(?<=SENSOR READOUT: )\d*.{4}/g'
# **REGEX Z_HEIGHT IDENTIFIER**
scan_ZValue = '/(?<=Z HEIGHT:   )\d*.{4}/g'

lineNum = scan_lineNum
probePosition = scan_probePosition
activeSensor = scan_activeSensor
sensorReadout = scan_sensorReadout
ZValue = scan_ZValue

if len(result) < 5000:
	print ("logfile contains less than 1 dataset")
elif len(result) > 5000:
	print ("logfile contains more than 1 dataset")
else:
	print ("logfile contains exactly one dataset")

print ("length of result is:", len(result), "entries")

for x, entry in enumerate(result):
	scan = re.search
	count = count + 1
	print ("result", x + 1, "is:", '\n', entry)

file.close()



