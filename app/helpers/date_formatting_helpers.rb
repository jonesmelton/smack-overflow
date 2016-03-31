module DateFormatting
  def long_form_date(timestamp)
    timestamp.strftime('%B %e, %Y, %l:%M %p')
  end
end

helpers DateFormatting
