
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #create new form to create a new article, loads form
  get "/articles/new" do
    erb :new
  end

  #create(post)
  #redirects to index, to veiw all articles, after user submits
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
    
  get '/articles' do  
    @articles = Article.all #array containing all articles, created instance variable to access in index view folder
    erb :index
  end

  get '/articles/:id' do   #SHOW PAGE For a specific instance with matching id
    @article = Article.find(params[:id])
    erb :show
    end

  get '/articles/:id/edit' do #update individual article
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{ @article.id }"
  end
  
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end
  
end


