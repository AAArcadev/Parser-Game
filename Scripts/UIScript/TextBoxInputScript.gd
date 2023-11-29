extends NinePatchRect

const InputResponse = preload("res://Scenes/GUIScene/InputResponse.tscn")
const NormalText = preload("res://Scenes/GUIScene/Response.tscn")

export var maxLinesRemember=30

var maxScrollLength=0

onready var commandProcessor=get_parent().get_node("CommandProcessor")
onready var historyRow=$ScrollContainer/HistoryRows
onready var scroll=get_node("ScrollContainer")
onready var scrollBar=scroll.get_v_scrollbar()

func _ready():
	scrollBar.connect("changed",self,"handle_scrollbar_changed")
	maxScrollLength=scrollBar.max_value
	$TextBoxInput/Input.grab_focus()
	
func handle_scrollbar_changed():
	if maxScrollLength != scrollBar.max_value:
		maxScrollLength=scrollBar.max_value
		scroll.scroll_vertical =scrollBar.max_value
		

func _on_Input_text_entered(new_text):
	var historyRow=$ScrollContainer/HistoryRows
	if new_text.empty():
		return
		
	$TextBoxInput/Input.clear()
	var input_response=InputResponse.instance()
	var response = commandProcessor.processCommand(new_text)
	input_response.setInput(new_text,response)
	historyRow.add_child(input_response)
	deleteHistory()
	
func normalText(text):
	var historyRow=$ScrollContainer/HistoryRows
	var normal_text=NormalText.instance()
	historyRow.add_child(normal_text)
	normal_text.bbcode_text=text
	deleteHistory()
	
func deleteHistory():
	var historyRow=$ScrollContainer/HistoryRows
	if historyRow.get_child_count()>maxLinesRemember:
		var rowsToForget=historyRow.get_child_count() - maxLinesRemember
		for _i in range(rowsToForget):
			historyRow.get_child(_i).queue_free()
			


