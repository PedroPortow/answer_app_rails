module UsersBackofficeHelper
  def avatar_url
    avatar = current_user.user_profile.avatar

    avatar.attached? ? avatar : 'img.jpg'
  end

  def date_formatter(to_date)
    DateTime.parse(to_date).localtime.strftime '%d-%m-%Y %H:%M:%S'
  end


end
