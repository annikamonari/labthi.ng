module IdeasHelper
	def print_categories
    suppress_comma = true
    print = ""
    @idea.category_list.each do |category|
      print += ", " unless suppress_comma
      suppress_comma = false
      print += link_to category, { controller: 'create', category: category }, class: 'category-tag'
    end

    return print.html_safe
	end
end