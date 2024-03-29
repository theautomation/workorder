import requests
import json
from datetime import datetime

import config
import checks

# Check local API connection and after how many seconds it must retry
checks.connection_check_url(config.api_url, 5)

# Open json file
file = open(config.json_file, "r")
json_object = json.load(file)

# Set value in json object
json_object["end_time"] = datetime.now().strftime("%H.%M")

# Write value in json file
file = open(config.json_file, "w")
json.dump(json_object, file)
file.close()

headers = {'Accept': 'application/json', 'Content-Type': 'application/json'}
requests.post(config.api_url, data=open(
    config.json_file, 'rb'), headers=headers)
