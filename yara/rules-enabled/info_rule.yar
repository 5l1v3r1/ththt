/*
	RULENAME = Info
	PURPOSE = Match possible intersting information in pastes
*/

rule info : info
{

	meta:
		description = "Rule for matching leaks"
		threat_level = 2 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-26"

	strings:
		$info = /\b(leak(s|eage|ing)|hack(s|ing)?|ransomware(s)?|attack(s)?|bank(s|ing)?|wallet(s)?|coin(s)?)\b/ nocase
	condition:
		$info
}
