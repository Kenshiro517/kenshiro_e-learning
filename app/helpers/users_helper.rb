module UsersHelper
  def user_avatar(user,classes)
    @avatar= user.avatar
    if @avatar.present?
      @avatar_user = image_tag( @avatar.url, class: classes)
    else
      @avatar_user = image_tag( 'default.jpg', class: classes)
    end
  end
  def current_user?(user)
    user == current_user
  end
end
