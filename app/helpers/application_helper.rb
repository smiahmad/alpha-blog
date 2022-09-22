module ApplicationHelper
  #this method returns the image associated to the email address from gravitar
  def gravitar_for(user, options = {size: 80})
    email_adderss = user.email.downcase
    hash = Digest::MD5.hexdigest(email_adderss)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{options[:size]}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

end
