Rails.application.routes.draw do

  root 'front_page#show'
  get 'more_posts', to: 'front_page#more_posts'


end
