
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    @articles = Article.new
    erb :new
  end
   
  post '/articles' do
    @articles = Article.create(params)
    redirect to "/articles/#{@articles.id}"
  end

  get '/articles/:id' do
    @articles = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do  #load edit form
    @articles = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do #edit action
    @articles = Article.find_by_id(params[:id])
    @articles.update(params[:article])
    redirect to "/articles/#{@articles.id}"
  end
  
  delete '/articles/:id' do #delete action
    @articles = Article.find_by_id(params[:id])
    @articles.delete
    redirect to '/articles'
  end
  


end
