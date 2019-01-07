/*
	RULENAME = Leaks
	PURPOSE = Match possible leakages in pastes
*/

rule leaks : leaks 
{

	meta:
		description = "Rule for matching leaks"
		threat_level = 2 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-07"

	strings:
		$str1 = "leak" fullword nocase
		$str2 = "hack" fullword nocase 
	condition:
		$str1 or #str2
}
