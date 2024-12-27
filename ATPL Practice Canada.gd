# DEMO ONLY
# NOT FULL CODE BASE
# THIS IS TO AVOID PIRACY AS THIS IS A COMMERCIAL APP.

func write_question_and_answers_to_buttons_text (question_number_index):
	
	# button object reference as "btn", "pos" is the relevant index, "index" just to keep track of answers a b c d
	var question_and_answers_dict = [
		{"btn": v.question_text, "pos": v.qPos, "index": "0"},
		{"btn": v.answer_a_button, "pos": v.aAPos, "index": "a"},
		{"btn": v.answer_b_button, "pos": v.aBPos, "index": "b"},
		{"btn": v.answer_c_button, "pos": v.aCPos, "index": "c"},
		{"btn": v.answer_d_button, "pos": v.aDPos, "index": "d"},
	]
	
	# just pull the one question
	var specific_question_data = v.array_active_question_bank[question_number_index]
	
	# pull the correct answer is the letter ie a b c d
	v.question_correct_answer = specific_question_data[v.correctAnswerPos]
	
	# loop through the array of dicts "question_and_answers_dict" from above
	for dict in question_and_answers_dict:
		
		# pull the button and write the text for that button
		dict["btn"].get_node(v.button_to_label_path).text = "[center]" + specific_question_data[dict["pos"]]
		
		# find the right answer
		if dict["index"] == v.question_correct_answer:
			
			# write to button for answer only game mode
			v.answer_only_button.get_node(v.button_to_label_path).text = "[center]" + specific_question_data[dict["pos"]]


func disable_answer_buttons (disable):
	
	# array of answer buttons
	var answer_buttons = [v.answer_a_button, v.answer_b_button, v.answer_c_button, v.answer_d_button]
	
	# loop through answer buttons and apply disable as required
	for btn in answer_buttons:
		btn.disabled = disable

func menu_chapter_selected (num):
	
	# set up screen after a chapter is selected
	assign_selected_chapter_to_active_array(num)
	reset_main_question_screen_and_draw_and_write_new_question(true)
	v.main_menu_board.visible = false
	
	# temp var to avoid calling multiple times
	var chpt_txt = v.chapter_text_main_board.get_node(v.button_to_label_path)
	
	# special chapter names
	var chpt_name_special ={
		11: "SARON",
		12: "SAMRA",
		100: "All Questions",
	}
	
	# if chapter 10 or less just read off question data
	if num <= 10:
		chpt_txt.text = "[center]" + v.array_active_question_bank[0][v.qChpTitlePos]
	# greater than 10 then use special chapter names
	else:
		chpt_txt.text = "[center]" + chpt_name_special[num]
