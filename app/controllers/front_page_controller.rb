class FrontPageController < ApplicationController
  include FrontPageHelper

  def show
    session[:posts] = nil
    @posts = get_more_posts()
  end

  def more_posts
    respond_to do |format|
      format.js do
        @posts = get_more_posts()
      end
    end
  end

end