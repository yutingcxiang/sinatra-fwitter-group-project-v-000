class TweetsController < ApplicationController
  get '/tweets' do
    erb :'tweets/tweet'
  end
  
  get '/tweets/new' do 
    erb :'tweets/create_tweet'
  end
  
  get '/tweets/:id' do
    erb :'tweets/show_tweet'
  end
  
  get '/tweets/:id/edit'
  erb :'tweets/edit_tweet'
  end
  
  post '/tweets/' do
  end
  
  patch '/tweets/:id' do
  end
end
