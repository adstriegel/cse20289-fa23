
import sys
import json

f = open(sys.argv[1])

TheData = json.open(f)

print(TheData["Current Connection"]["SSID"])


