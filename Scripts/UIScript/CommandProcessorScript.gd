extends Node

onready var player=get_parent().get_node("MapBoxHolder2/ViewportContainer/Viewport/MapWorld/Player")
onready var textBox=get_parent().get_node("TextBoxHolder")

func processCommand(input):
	var words = input.split(" ",false, 0)
	if words.size()==0:
		return "No words where parsed"
		
	var firstWord=words[0].to_lower()
	var secondWord= ""
	if  words.size()>1:
		secondWord=words[1].to_lower()
		
	match firstWord:
		"forward":
			return forward(secondWord)
		"fd":
			return forward(secondWord)
			
		"backward":
			return backward(secondWord)
		"bk":
			return backward(secondWord)
		
		"right":
			return right(secondWord)
		"rt":
			return right(secondWord)
			
		"left":
			return left(secondWord)
		"lt":
			return left(secondWord)
			
			
		"open":
			return open(secondWord)
		_:
			return "Perhaps you're truly made a mistake. Or perhaps you're just trying to waste time. Either way, you'll eventually have to face THE RECKONING eventually..."
			
func forward(secondWord):
	if secondWord=="":
		return "Move forward how many times?"
		
	player.moveNorth(int(secondWord))
	return "You move forward %s" % secondWord +" times."
	
func backward(secondWord):
	if secondWord=="":
		return "Move backward how many times?"
		
	player.moveSouth(int(secondWord))
	return "You move backward %s" % secondWord +" times."
		
func right(secondWord):
	if secondWord=="":
		return "Move right how many times?"
		
	player.moveEast(int(secondWord))
	return "You move right %s" % secondWord +" times."

func left(secondWord):
	if secondWord=="":
		return "Move left how many times?"
		
	player.moveWest(int(secondWord))
	return "You move left %s" % secondWord +" times."

		
func open(secondWord):
		if secondWord=="":
			return "Open what?"
		
		if secondWord=="door":
			get_parent().get_node("PlayerInfoHolder").hasKey=false
			return "You opened the "+secondWord+"."
		
		
