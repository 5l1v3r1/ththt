rule mails : mails 
{

	meta:
		description = "Rule for matching e-mail leaks"
		created_on = "2019-01-05"
		last_updated = "2019-01-26"
	strings:
		$emailaddr = /\b\S+@\S+\.[\w-]+(\:|\||\t)\S+\b/ 
	condition:
		#emailaddr > 10
}

rule dox : dox
{
	meta:
		description = "Rule for matching dox"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$dox = "DOX" fullword nocase
	condition:
		$dox
}

rule darknet : darknet 
{

	meta:
		description = "Rule for matching darknet related websites"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$darknet = /\S+\.onion/
	condition:
		any of them
}

rule porn : porn
{

	meta:
		description = "Rule for matching possible pornographic links"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$porn = "pornhub"
		$porn_1 = "porn" fullword nocase
	condition:
		any of them
}

rule videogame : videogame
{
	meta:
		description = "Rule for finding videogame related pastes"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$videogame = "SimC" fullword
		$videogame_1 = "warcraft" fullword nocase
		$videogame_2 = "minecraft" fullword nocase
	condition:
		any of them
}

rule streaming : streaming
{
	meta:
		description = "Rule for matching streamings"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$streaming = "streaming" nocase
		$streaming_1 = "#EXTINF:"
		$streaming_2 = "SPORT TV" fullword nocase
		$streaming_3 = "streamtv"
		$streaming_4 = "#EXTM3U" fullword
		$streaming_5 = "watch2hd"
		$streaming_6 = "live_tv"
		$streaming_7 = "streamable"
	condition:
		any of them
}

rule torrent : torrent
{

	meta:
		description = "Rule for matching possible torrents"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$torrent = "torrent" nocase
		$torrent_1 = /\S+\.mkv/
	condition:
		any of them
}

rule code : code
{
	meta:
		description = "Rule for matching possible codes"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$code = "import" fullword
		$code_1 = "java" fullword nocase
		$code_2 = "}"
		$code_3 = "<html"
		$code_4 = "<?php"
		$code_5 = "class "
		$code_6 = "FROM" fullword
		$code_7 = /^version:/
		$code_8 = "<script>" 
		$code_9 = "elif " 
		$code_10 = "</vbox> " 
		$code_11 = "print("
		$code_12 = ");"
		$code_13 = "println("
		$code_14 = "</title>"
		$code_15 = "<?xml "
	condition:
		any of them
}

rule linux : linux
{
	meta:
		description = "Rule for Linux commands"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$linux = "echo "
		$linux_1 = "Traceback" fullword
		$linux_2 = "/bin/bash"
		$linux_3 = "chmod "
		$linux_4 = "chown "
		$linux_5 = "mkdir "
		$linux_6 = "grep "
	condition:
		any of them
}

rule base64 : base64
{
	meta:
		description = "Rule for matching bas64"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$base64 = /^[\w\d\!\-\(\)\+\/=]{100,}$/
	condition:
		any of them
}

rule fanfic : fanfic 
{
	meta:
		description = "Rule for matching fanfic"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$fanfic = /^[a-zA-Z .,!;:\(\)\[\]\-?'"\n]{500,}/ 
	condition:
		any of them
}

rule text : text 
{
	meta:
		description = "Rule for matching possible simple text"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"
	strings:
		$text = /^[a-zA-Z .,!;:\(\)\[\]\-?'"\n]+/ 
	condition:
		any of them
}
