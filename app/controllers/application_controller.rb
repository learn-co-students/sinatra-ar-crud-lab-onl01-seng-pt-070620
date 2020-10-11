
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #Create

  get '/articles/new' do

    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title])

    redirect :'/articles/#{@article.id}'
  end

  #Read

  get '/articles' do

    erb :index
  end

  get '/articles/:id' do

    @article = Article.find(params[:id])
    erb :'articles/show'
  end

  #Update

  get '/articles/:id/edit' do

    erb :edit
  end

  patch 'articles/:id' do

    redirect :'/articles/#{@article.id}'
  end

  #Delete
  delete 'articles/:id' do
    @article = Article.find(params[:id])
    @article.clear
    
  end


end
