#!/usr/bin/python3

from datetime import datetime
import requests, json, time, math, csv, logging, os

PostLimit = "5"

def convert_size(size_bytes):
   if size_bytes == 0:
       return "0B"
   size_name = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
   i = int(math.floor(math.log(size_bytes, 1024)))
   p = math.pow(1024, i)
   s = round(size_bytes / p, 2)
   return "%s %s" % (s, size_name[i])

class MaxSizeList(list):
    def __init__(self, maxlen):
        self._maxlen = maxlen

    def append(self, element):
        self.__delitem__(slice(0, len(self) == self._maxlen))
        super(MaxSizeList, self).append(element)

listKeyT = MaxSizeList(PostLimit)
listTitleT = MaxSizeList(PostLimit)
listDateT = MaxSizeList(PostLimit)
listSizeT = MaxSizeList(PostLimit)
listExT = MaxSizeList(PostLimit)
listSynT = MaxSizeList(PostLimit)

now = datetime.now()
if not os.path.exists(now.strftime('%Y/%m/%d')):
	os.makedirs(now.strftime('%Y/%m/%d'))

FileName = str(now.strftime('%Y/%m/%d'))+"/PasteBin_" + str(now.strftime('%Y-%m-%d_%H')) + ".csv"

csvFile = open(FileName, 'a')
writer = csv.writer(csvFile)

while True:
	# Every 60sec
	posts = requests.get("https://scrape.pastebin.com/api_scraping.php?limit=" + PostLimit).text
	# print(posts)
	jsonpostslist = json.loads(posts)

	NbPosts = 0
	for jsonpost in jsonpostslist:
		if jsonpost["key"] not in listKeyT:
			NbPosts+=1
			
			listKeyT.append(jsonpost["key"])
			if jsonpost["title"] == "":
				listTitleT.append("Untitled")
			else:
				listTitleT.append(jsonpost["title"])
			listDateT.append(datetime.utcfromtimestamp(int(jsonpost["date"])).strftime('%Y-%m-%d %H:%M:%S'))
			listSizeT.append(int(jsonpost["size"]))
			if jsonpost["expire"] == "0":
				listExT.append("NEVER")
			else:
				listExT.append(datetime.utcfromtimestamp(int(jsonpost["expire"])).strftime('%Y-%m-%d %H:%M:%S'))
			listSynT.append(jsonpost["syntax"])

			# Add in csv file
			writer.writerow([listDateT[-1],listKeyT[-1],listTitleT[-1],listSynT[-1],listSizeT[-1],listExT[-1]])

		# if jsonpost["title"] == "":
		# 	jsonpost["title"] = "Untitled"
		# print("Title: " + jsonpost["title"])
		# print("Key: " + jsonpost["key"]) # for full URL: https://pastebin.com/{key}
		# # print(jsonpost["date"])
		# print("Publication Date: "+datetime.utcfromtimestamp(int(jsonpost["date"])).strftime('%Y-%m-%d %H:%M:%S'))
		# print("Size: " + convert_size(int(jsonpost["size"])))
		# if jsonpost["expire"] == "0":
		# 	jsonpost["expire"] = "NEVER"
		# 	print("Expiration: " + jsonpost["expire"])
		# else:
		# 	print("Expiration: " + datetime.utcfromtimestamp(int(jsonpost["expire"])).strftime('%Y-%m-%d %H:%M:%S'))

		# print("Syntax: " + jsonpost["syntax"])
		# print("-------------------")

	logging.basicConfig(filename='pastebin.log',level=logging.INFO,format='%(asctime)s %(levelname)-8s %(message)s',datefmt='%Y-%m-%d %H:%M:%S%p')
	logging.info("Loop Completed | " + str(NbPosts) + " Posts")
		
	# print(listKeyT)
	# print(listTitleT)
	# print(listDateT)
	# print(listSizeT)
	# print(listExT)
	# print(listSynT)
	
	time.sleep(10)

csvFile.close()

# https://github.com/Tu5k4rr/PastaBean/blob/master/PastaBean.py

# https://tryolabs.com/blog/2015/02/17/python-elasticsearch-first-steps/

# https://github.com/kevthehermit/PasteHunter
# Upgrade with:
# pastebin.com
# dumpz.org
# gist.github.com
# paste.ee