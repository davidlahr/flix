module UsersHelper

  def special_date(d)
    d.created_at.strftime("%B, %Y")
  end

end
