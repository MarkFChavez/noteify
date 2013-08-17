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
end
