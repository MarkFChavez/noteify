# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#new_note_btn").on "click", (e) ->
		e.preventDefault()

		html = "<strong>Note:</strong> All fields are required. Content should be atleast 5 characters in length"

		$("#result").attr('class', 'alert alert-info').html(html)
		$('#add_account').modal('show')


	$("#single_close").on "click", (e) ->
		e.preventDefault()
		$('#add_account').modal('hide')

	$("#save_note").on "click", (e) ->
		e.preventDefault()
		action = $("#new_note").attr 'action'
		title = $("#note_title").val()
		content = $("#note_content").val()

		$.ajax action,
			type:"POST"
			dataType: "json"
			data:
				note:
					title: title
					content: content
			success: (data) ->
				$("#result").removeClass('alert').removeClass('alert-info')

				if data != null
					if data.validation == 0 #success
						$("#result").html "<div class='alert alert-success'> #{data.result} </div>"
					else
						$("#result").html "<div class='alert alert-error'> #{data.result} </div>"
				else
					$("#result").html "Unable to create note"
			error: (data) ->
				alert 'error'
			complete: (data) ->
				$("#note_title").val('')
				$("#note_content").val('')

