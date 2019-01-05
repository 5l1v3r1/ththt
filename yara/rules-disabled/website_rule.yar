/*
	RULENAME = Website
	PURPOSE = Match website-like strings in pastes
*/

rule website : website 
{

	meta:
		description = "Rule for matching URLs, Domains"
		threat_level = 3 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-05"

	strings:
		$a = /\S+\.\S+/

	condition:
		any of them
}