/*
	RULENAME = IOCs
	PURPOSE = Match possible IOCs in pastes
*/

rule iocs : iocs
{

	meta:
		description = "Rule for matching iocs"
		threat_level = 4 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-26"

	strings:
		$md5 = /\b[a-fA-F\d]{32}\b/
		$sha1 = /\b[a-fA-F\d]{40}\b/
		$sha256 = /\b[a-fA-F\d]{64}\b/
		$ipv4 = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
		$domain = /\S+\.\S+/
		$ioc = /(ransomware|trojan|crypto|hack|APT|Emotet|Trickbot|ioc)/
	condition:
		(($md5 or $sha1 or $sha256) and (#ipv4 > 10 or #domain > 10)) or $ioc
}