
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

   get '/articles/new' do #loads new form
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
    @article = Article.find_by_id(params[:id])
    @article.name = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
    erb :show
  end

    
  
  
end
