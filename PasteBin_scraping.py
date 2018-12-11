#!/usr/bin/python3

from datetime import datetime
import requests, json
import math

PostLimit = "5"

def convert_size(size_bytes):
   if size_bytes == 0:
       return "0B"
   size_name = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
   i = int(math.floor(math.log(size_bytes, 1024)))
   p = math.pow(1024, i)
   s = round(size_bytes / p, 2)
   return "%s %s" % (s, size_name[i])

# Every 60sec
posts = requests.get("https://scrape.pastebin.com/api_scraping.php?limit=" + PostLimit).text
# print(posts)
jsonpostslist = json.loads(posts)

for jsonpost in jsonpostslist:
	print("Tile: " + jsonpost["title"])
	print("Key: " + jsonpost["key"]) # for full URL: https://pastebin.com/{key}
	# print(jsonpost["date"])
	print("Publication Date: "+datetime.utcfromtimestamp(int(jsonpost["date"])).strftime('%Y-%m-%d %H:%M:%S'))
	print("Size: " + convert_size(int(jsonpost["size"])))
	if jsonpost["expire"] == "0":
		jsonpost["expire"] = "NEVER"
		print("Expiration: " + jsonpost["expire"])
	else:
		print("Expiration: " + datetime.utcfromtimestamp(int(jsonpost["expire"])).strftime('%Y-%m-%d %H:%M:%S'))

	print("Syntax: " + jsonpost["syntax"])
	print("-------------------")

# https://github.com/Tu5k4rr/PastaBean/blob/master/PastaBean.py

# https://github.com/kevthehermit/PasteHunter
# Upgrade with:
# pastebin.com
# dumpz.org
# gist.github.com
# paste.ee