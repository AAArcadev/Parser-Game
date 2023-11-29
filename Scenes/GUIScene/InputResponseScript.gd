extends Control

func setInput(input,response):
	$InputHistory.text=" - "+input
	$Response.bbcode_text=response
	margin_bottom=$Response.margin_bottom
	
	
