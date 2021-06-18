module UsersHelper
  def who_to_follow_list(follower)
    res = ''

    followers_list = current_user.followers.pluck(:followed_id)

    unless followers_list.include?(follower.id) || current_user.id == follower.id
      follower_picture = link_to follower do
        follow_picture(follower)
        # gravatar_image_tag(@user.email, size: 64, alt: current_user.name)
      end

      res << "<div class='d-flex'>"
      res << follower_picture.to_s
      res << "<div class='d-flex flex-column my-auto '>"
      res << "<p class='p-2 '>#{follower.name}</p>"
      res << '</div>'
      res << '</div>'
    end
    res.html_safe
  end

  def profile_picture(user)
    if user.photo.file.nil?
      img = gravatar_image_tag(user.email, size: 64, alt: current_user.name)
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='profile-picture'>".html_safe
    end
  end

  def cover_image(user)
    if user.cover.file.nil?
      img = 'https://i2.wp.com/diplomartbrussels.com/wp-content/uploads/2020/09/food-background-images-94-images-in-co-381169-png-images-pngio-food-background-png-1440_619.png?ssl=1'
      "<img src='#{img}' class='img-cover'>".html_safe
    else
      img = Cloudinary::Utils.cloudinary_url(user.cover.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='img-cover'>".html_safe
    end
  end

  def user_image(user)
    if user.photo.file.nil?
      img = gravatar_image_tag(user.email, size: 64, alt: current_user.name)
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='user-image'>".html_safe
    end
  end

  def follow_picture(user)
    if user.photo.file.nil?
      img = gravatar_image_tag(user.email, size: 64, alt: current_user.name)
    else
      img = Cloudinary::Utils.cloudinary_url(user.photo.filename, fetch_format: 'auto', quality: 'auto')
      "<img src='#{img}' alt='' class='follow-picture image is-64x64'>".html_safe
    end
  end
end
