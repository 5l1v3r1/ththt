/*
	RULENAME = Patterns
	PURPOSE = Match possible intersting patterns in pastes
*/

rule dox : dox
{

	meta:
		description = "Rule for matching dox"
		threat_level = 2 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"

	strings:
		$dox = "DOX" fullword
	condition:
		$dox
}


rule streaming : streaming
{

	meta:
		description = "Rule for matching streamings"
		threat_level = 2 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-28"

	strings:
		$streaming = "streaming" fullword nocase
	condition:
		$streaming
}
