
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # create action
  get '/articles/new' do
    erb :new
  end 

  post '/articles' do 
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end 

  # read action
  get '/articles' do
    erb :index
  end
 
  get '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    erb :show
  end 

  # update action
  get "/articles/:id/edit" do 
    # binding.pry
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id/edit" do
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
    # binding.pry
  end 

  # delete action
  # get '/articles/:id' do
  #   erb :show
  # end 

  # post '/articles/:id' do
  #   erb :show
  # end 

  delete '/articles/:id' do
    #binding.pry
    @article = Article.find_by(id: params[:id])
    @article.delete
    redirect '/articles'
  end 

end
