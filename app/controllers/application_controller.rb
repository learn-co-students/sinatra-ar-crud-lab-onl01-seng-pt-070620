
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    @article = Article.new(params).save
 
    redirect '/articles/3'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end



  patch '/articles/:id' do
    
    Article.delete(params[:id])

    Article.new(params.except(:_method)).save

    erb :show
    
  end

  delete '/articles/:id' do
    
    Article.delete(params[:id])

    

    @articles = Article.all

    erb :index
  end

end
