# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

	$('#fb_image').on "mouseover", (e) ->
		e.preventDefault()
		$(this).tooltip('show')

	$('#fb_image').on "click", (e) ->
		e.preventDefault()
		window.open($(this).prop('href'))

	$('#twitter_image').on "click", (e) ->
		e.preventDefault()
		window.open($(this).prop('href'))
		
	$('#twitter_image').on "mouseover", (e) ->
		e.preventDefault()
		$(this).tooltip('show')		
		
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

	
	$('#in').on "click", (e) ->
		e.preventDefault()
		$('#sign_up').modal('show')

	$('#in_up').on "click", (e) ->
		e.preventDefault()
		token = $('input[name=authenticity_token]').val()
		username = $('#signuser_username').val()
		email = $('#signuser_email').val()
		password = $('#signuser_password').val()
		confirm = $('#signuser_password_confirmation').val()
		action = $('#new_sign_in').attr('action')
		dashboard_path = $("#dashboard_url").val()
		
		$.ajax action,
			type:"POST"
			dataType: "json"
			data: {
				user: {
					username:username
					email:email
					password:password
					password_confirmation:confirm
				}
			}
			success: (data) ->
				window.location.href = dashboard_path
			error: (data) ->
				html_data = "<strong>Wew!!!</strong> Error Occured"
				$('#result').removeAttr('class')
				$('#result').attr('class','alert alert-error')
				$('#result').html(html_data)
			
	$('#sign_close').on "click", (e) ->
		e.preventDefault()
		$('#sign_up').modal('hide');			
