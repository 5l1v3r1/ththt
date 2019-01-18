/*
	RULENAME = Base64
	PURPOSE = Match possible base64 in pastes
*/

rule base64 : base64 
{

	meta:
		description = "Rule for matching base64 dump"
		threat_level = 2 // 1 to 5, where 5 is Critical ~ the relevancy of the gathered information
		category = "informational"
		tlp = "white"
		author = "@zemelusa"
		created_on = "2019-01-13"
		last_updated = "2019-01-13"

	strings:
		$str1 = /([A-Za-z0-9+\/]{4}){3,}([A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?/ 
	condition:
		$str1
}
