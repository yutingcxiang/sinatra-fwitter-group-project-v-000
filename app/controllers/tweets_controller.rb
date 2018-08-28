class TweetsController < ApplicationController
  get '/tweets' do
    if logged_in?
      @tweets = Tweets.all
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end
  
  get '/tweets/new' do 
    if logged_in?
      erb :'tweets/create_tweet'
    else
      redirect '/login'
    end
  end
  
  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/show_tweet'
    else
      redirect '/login'
    end
  end
  
  get '/tweets/:id/edit' do
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in?
      erb :'tweets/edit_tweet'
    else
      redirect '/login'
    end
  end
  
  post '/tweets/:id' do
    if params[:content].empty?
      redirect '/tweets/create_tweet'
    else
      @tweet = Tweet.new(content: params[:content])
      @tweet.user_id = current_user.id
      @tweet.save
      redirect "/tweets/#{@tweet.id}"
    end
  end
  
  patch '/tweets/:id' do
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in?
      if params[:content].empty?
        redirect '/tweets/edit_tweet'
      else
        if @tweet && @tweet.user == current_user
          @tweet.update(content: params[:tweet])
          @tweet.save
          redirect "/tweets/#{@tweet.id}"
        else
          redirect "/tweets"
        end
      end
    end
  end
  
  delete '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    if logged_in?
      if @tweet && @tweet.user == current_user
        @tweet.delete
      end
      redirect '/tweets'
    else
      redirect '/login'
    end
  end
end
