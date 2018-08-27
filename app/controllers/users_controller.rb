class UsersController < ApplicationController
  get '/' do
    erb :index
  end
  
  get '/users/:slug' do
  end
  
  get '/signup' do
  end
  
  get '/login' do
  end
  
  post '/signup' do
  end
  
  post '/login' do
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end
  
end
