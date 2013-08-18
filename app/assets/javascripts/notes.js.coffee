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
		dashboard_path = $("#dashboard_path").val()

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
					if data.validation == 0
						window.location.href = dashboard_path
					else
						$("#result").html "<div class='alert alert-error'> #{data.result} </div>"
				else
					$("#result").html "Unable to create note"
			error: (data) ->
				alert 'error'
			complete: (data) ->
				$("#note_title").val('')
				$("#note_content").val('')


	$ ->
	  $(".draggable").each ->
	    $(this).draggable 
	    	helper: "clone"

	  $(".force-overflow").droppable(
	    activeClass: 
	    	"ui-state-hover"
	    hoverClass:
	    	"ui-state-active"
	    accept:
	    	":not(.ui-sortable-helper)"
	    drop: (event, ui) ->
	      draggedElem = $(ui.draggable)
	      elemId = draggedElem.attr('for_delete')
	      
	      category = $(@).data('category')
	      for_update = draggedElem.attr('for_update')

	      $(ui.draggable).addClass "ui-state-highlight"

	      if $(ui.draggable).hasClass("draggable-source")
	        $(ui.draggable).clone().appendTo(this).removeClass "draggable-source"
	      else
	        $(ui.draggable).appendTo(this)



	      $.ajax for_update,
	      	type:"POST"
	      	dataType:"json"
	      	data:
	      		note:
	      			category: category
	      	success: (data) ->
	      		html = "<div class='pull-right'><a rel='nofollow' href='/notes/#{elemId}' class='close' data-method='delete'>x</a></div>";
	      		draggedElem.find('p').append(html)
	      	error: (data) ->
	      		alert 'error'
              
	      draggedElem.find(".note-title").css({fontSize:"20px"})
	      draggedElem.find(".note-content-foo").show()
	  )
