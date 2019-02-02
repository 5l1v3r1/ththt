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
		last_updated = "2019-01-28"

	strings:
		$ioc = /(ransomware|trojan|crypto|APT|Emotet|Trickbot|ioc)/
	condition:
		$ioc
}
