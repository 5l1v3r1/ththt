#!/usr/bin/python3

import json
import logging
import math
import os
import requests
import time
import yara
from datetime import datetime

SampleLimit = "25"

class MaxSizeList(list):
    def __init__(self, maxlen):
        self._maxlen = maxlen

    def append(self, element):
        self.__delitem__(slice(0, len(self) == self._maxlen))
        super(MaxSizeList, self).append(element)

ListSampleID = MaxSizeList(SampleLimit)

while True:
	# Every 60sec
	now = datetime.now()
	if not os.path.exists(now.strftime('logs/%Y/%m/%d')):
		os.makedirs(now.strftime('logs/%Y/%m/%d'))

	FileName = str(now.strftime('logs/%Y/%m/%d'))+"/virustotal_" + str(now.strftime('%Y%m%d_%Hh')) + ".log"
	OutputFile = open(FileName, 'a')
	
	# Load response as a Json format 
	jsonsampleslist = requests.get("https://www.virustotal.com/ui/comments?relationships=author,item&limit=" + SampleLimit).json()["data"]

	NbSamples = 0
	for jsonsample in jsonsampleslist:
		# If virustotal file ID not know add it to our DB
		if jsonsample["relationships"]["item"]["data"]["id"] not in ListSampleID:
			virustotalsample = {}
			NbSamples+=1
			ListSampleID.append(jsonsample["relationships"]["item"]["data"]["id"])

			virustotalsample['sampleID'] = jsonsample["relationships"]["item"]["data"]["id"]
			virustotalsample['comment'] = jsonsample["attributes"]["text"]
			virustotalsample['date'] = jsonsample["attributes"]["date"]

			virustotalsample['tags'] = jsonsample["attributes"]["tags"]
			virustotalsample['votes'] = jsonsample["attributes"]["votes"]
			virustotalsample['author'] = jsonsample["relationships"]["author"]["data"]["id"]

			# Add in log file
			OutputFile.write(json.dumps(virustotalsample)+'\n')

	logging.basicConfig(filename='virustotal.log',level=logging.INFO,format='%(asctime)s %(levelname)-8s %(message)s',datefmt='%Y-%m-%d %H:%M:%S%p')
	logging.info("Loop Completed | " + str(NbSamples) + " Samples")

	OutputFile.close()
	time.sleep(60)