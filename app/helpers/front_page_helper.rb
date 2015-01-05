module FrontPageHelper

  def get_more_items(i)
    response = HTTParty.get("http://www.stellarbiotechnologies.com/media/press-releases/json?limit=10&offset=#{i}")
    JSON.parse(response.body)['news']
  end

end