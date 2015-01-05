class FrontPageController < ApplicationController
  include FrontPageHelper

  def show
    @posts = get_more_items(0)
    session[:posts_count] = 10
  end

  def more_posts
    respond_to do |format|
      format.js do
        @new_posts = get_more_items(session[:posts_count])
        session[:posts_count] += 10
      end
    end
  end

end