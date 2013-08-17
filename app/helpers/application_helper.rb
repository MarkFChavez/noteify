module ApplicationHelper
	def t(page_title=nil)
		content_for :title do
			if page_title
				"Noteify | #{page_title}"
			else
				"Noteify"
			end
		end
	end

	def g(user, klazz, options={})
		options[:default] = 'https://assets.github.com/images/gravatars/gravatar-140.png'

		gravatar_image_tag(user.email,title:"Change display picture",class:klazz,gravatar: options)
	end
end
