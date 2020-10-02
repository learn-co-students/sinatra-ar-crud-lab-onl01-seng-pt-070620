
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # create as CURD actions
  get '/articles/new' do
    erb :new
  end 

  post '/articles' do 
 
    # user_input = params[:user_input]
   
    @article = Article.create(title: params[:title], content: params[:content])
   
    redirect '/articles/#{@article.id}'
  end 

  # read as CURD actions 
  get '/articles' do
    # @articles = Article.all
    erb :index
  end

  get '/articles/:id' do 
    @article = Article.find_by[:id]
    erb :show
  end 



end
