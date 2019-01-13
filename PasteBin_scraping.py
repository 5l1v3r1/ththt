#!/usr/bin/python3

import json
import logging
import math
import os
import requests
import time
import yara
from datetime import datetime

PostLimit = "100"

class MaxSizeList(list):
    def __init__(self, maxlen):
        self._maxlen = maxlen

    def append(self, element):
        self.__delitem__(slice(0, len(self) == self._maxlen))
        super(MaxSizeList, self).append(element)

listKeyT = MaxSizeList(PostLimit)

# YARA Rules
rules = yara.compile('yara/rules.yar')

while True:
	# Every 60sec
	now = datetime.now()
	if not os.path.exists(now.strftime('logs/%Y/%m/%d')):
		os.makedirs(now.strftime('logs/%Y/%m/%d'))

	FileName = str(now.strftime('logs/%Y/%m/%d'))+"/pastebin_" + str(now.strftime('%Y%m%d_%Hh')) + ".log"
	OutputFile = open(FileName, 'a')
	
	# Load response as a Json format 
	jsonpostslist = requests.get("https://scrape.pastebin.com/api_scraping.php?limit=" + PostLimit).json()

	NbPosts = 0 
	for jsonpost in jsonpostslist:
		# If pastebin.key not know add it to our DB
		if jsonpost["key"] not in listKeyT:
			NbPosts+=1
			match=""
			listKeyT.append(jsonpost["key"])

			# Get the rawpaste for each new pastebin key 
			rawpastedata = requests.get("https://scrape.pastebin.com/api_scrape_item.php?i=" + jsonpost["key"]).text
			# if match yara rule store the paste in the log
			match=rules.match(data=rawpastedata)

			if match:
				jsonpost["rawpaste"] = rawpastedata
				jsonpost["yararule"] = str(match)

			# Add in log file
			OutputFile.write(json.dumps(jsonpost)+'\n')

	logging.basicConfig(filename='pastebin.log',level=logging.INFO,format='%(asctime)s %(levelname)-8s %(message)s',datefmt='%Y-%m-%d %H:%M:%S%p')
	logging.info("Loop Completed | " + str(NbPosts) + " Posts")

	OutputFile.close()
	time.sleep(60)

# https://github.com/Tu5k4rr/PastaBean/blob/master/PastaBean.py

# https://tryolabs.com/blog/2015/02/17/python-elasticsearch-first-steps/

# https://github.com/kevthehermit/PasteHunter
# Upgrade with:
# pastebin.com
# dumpz.org
# gist.github.com
# paste.ee
