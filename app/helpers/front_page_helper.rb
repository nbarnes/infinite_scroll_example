module FrontPageHelper

  @@posts_per_call = 7

  def get_more_posts()
    unless session[:posts]
      response = response = HTTParty.get("http://www.stellarbiotechnologies.com/media/press-releases/json")
      session[:posts] = JSON.parse(response.body)['news'].sort do |a, b|
        DateTime.parse(b['published']) <=> DateTime.parse(a['published'])
      end
      session[:posts_returned_count] = 0
    end
    posts_slice = session[:posts].slice(session[:posts_returned_count], return_length)
    session[:posts_returned_count] += @@posts_per_call
    return posts_slice ? posts_slice : Array.new
  end

  def return_length
    a = @@posts_per_call
    b = session[:posts].length - session[:posts_returned_count]
    return a < b ? a : b
  end

end