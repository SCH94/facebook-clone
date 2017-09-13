module ApplicationHelper
  def gravatar_for(user, size=50)
    hash = Digest::MD5.hexdigest(user.email)
    image_tag("https://www.gravatar.com/avatar/#{hash}", size: size, class: "gravatar")
  end
end
