module ApplicationHelper

	def article_cover url, options = {}

		html_class = options[:class]
		html_style = "background:url(#{url});"\
					"width:100%;height:400px;background-size: cover;"
		html = "<header style='#{html_style}' class='#{html_class}'>" \
				"</header>"

		html.html_safe
	
	end


	def articles_as_json(articles)
	  articles.collect do |article|
	    {
	      :id => comment.id,
	      :level => comment.level,
	      :content => html_format(comment.content),
	      :parent_id => comment.parent_id,
	      :user_id => comment.user_id,
	      :created_at => comment.created_at
	    }
	  end.to_json
	end

end

