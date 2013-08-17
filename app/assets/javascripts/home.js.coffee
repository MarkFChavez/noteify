# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#sign").on "click", (e) ->
		e.preventDefault()
		
		email = $("#user_email").val()
		password = $("#user_password").val()
		action = $("#new_user").attr 'action'
		dashboard_path = $("#dashboard_url").val()

		if email == "" && password == ""
			$("#error_account").modal 'show'
		else
			$.ajax action,
				type:"POST"
				dataType: "json"
				data: {
					user: {
						email: email
						password: password
					}
				}
				success: (data) ->
					window.location.href = dashboard_path
				error: (data) ->
					$("#error_account").modal 'show'				

	$("#error_close").on "click", (e) ->
		e.preventDefault()
		$("#error_account").modal 'hide'

	$("#error_closes").on "click", (e) ->
		e.preventDefault()
		$("#e_account").modal 'hide'

	

