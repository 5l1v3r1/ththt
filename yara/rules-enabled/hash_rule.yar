/*
	RULENAME = Hashes
	PURPOSE = Match possible hashes in pastes
*/

rule hash : hashes
{

	meta:
		description = "Rule for matching hashes"
		threat_level = 4 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-17"

	strings:
		$md5 = /\b[a-fA-F\d]{32}\b/
		$sha1 = /\b[a-fA-F\d]{40}\b/
		$sha256 = /\b[a-fA-F\d]{64}\b/
	condition:
		$md5 or $sha1 or $sha256
}