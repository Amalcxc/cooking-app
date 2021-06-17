module UsersHelper
  def who_to_follow_list(follower)
    res = ''

    followers_list = current_user.followers.pluck(:followed_id)

    unless followers_list.include?(follower.id) || current_user.id == follower.id
      follower_picture = link_to follower do
       gravatar_image_tag(@user.email, size: 64, alt: current_user.name)
      end

      res << "<div class='d-flex'>"
      res << follower_picture.to_s
      res << "<div class='d-flex flex-column my-auto'>"
      res << "<p class='p-2'>#{follower.name}</p>"
      res << '</div>'
      res << '</div>'
    end
    res.html_safe
  end
end
