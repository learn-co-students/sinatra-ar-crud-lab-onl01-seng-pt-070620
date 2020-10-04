require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

   get '/articles/new' do #loads new form
    @article = Article.new
    erb :new
   end

  get '/articles' do #loads index page
    @articles = Article.all
    erb :index
  end
  


  get '/articles/:id' do  #loads show page
    @article = Article.find_by_id(params[:id])
    erb :show
  end
  
  post '/articles' do  #creates a article
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end 

  get '/articles/:id/edit' do #loads edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do  #updates a article
  

    @article = Article.find(params[:id])
    @article.update(params[:article])
    #@article.update(title: params[:title], content: params[:content])
    

    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    
    Article.destroy(params[:id])
    redirect to '/articles'
  end

    
  
  
end
