module ApplicationHelper
  
  def gr_to chef, options = { size: 80 }
    
    id = Digest::MD5::hexdigest(chef.email.downcase)
    size = options[:size]
    url = "https://secure.gravatar.com/avatar/#{id}?s=#{size}"
    image_tag(url, alt: chef.chefname, class: "gravatar")
  
  end
end
