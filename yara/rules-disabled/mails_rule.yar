/*
	RULENAME = Mails
	PURPOSE = Match possible mail + password leakages in pastes
*/

rule mails : mails 
{

	meta:
		description = "Rule for matching e-mail leaks"
		threat_level = 4 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-05"
		last_updated = "2019-01-26"

	strings:
		$emailaddr = /\b\S+@\S+\.[\w-]+(\:|\||\t)\S+\b/ 
	condition:
		#emailaddr > 10
}
