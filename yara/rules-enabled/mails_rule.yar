/*
	RULENAME = Mails
	PURPOSE = Match possible mail leakages in pastes
*/

rule leaks : leaks 
{

	meta:
		description = "Rule for matching mail leaks"
		threat_level = 4 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-07"

	strings:
		$str1 = /\b[\w-]+@[\w-]+\.[a-zA-Z]+\:\S+\b/ 
	condition:
		#str1 > 10
}
