module ApplicationHelper

  def full_title(page_name)
    base = "AnonyChats"
    if page_name.empty?
      base
    else
      "#{base} | #{page_name}"
    end
  end
end
