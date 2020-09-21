
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  get '/show' do
    erb :show
  end

  get '/index' do 
    erb :index
  end

# Create the get '/articles/:id' controller action. This action should use Active Record to grab 
# the article with the id that is in the params and set it equal to @article. Then, it should render 
# the show.erb view page. That view should use ERB to render the @article's title and content.
  get '/articles/new' do 
    erb :new
  end

  get '/articles' do
    @articles = Article.all #so I can reference all articles anywhere
    erb :index
  end

  get '/articles/:id' do 
    @article = Article.all.find_by(id: params[:id])
    erb :show
  end

  post '/articles' do
    @new_article = Article.create(title: params[:title], content: params[:content])
    redirect :"articles/#{@new_article.id}"
  end

  get '/articles/:id/edit' do
    @edit_article = Article.all.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @updated_article = Article.all.find_by(id: params[:id])
    @updated_article.update(title: params[:title], content: params[:content])
    redirect :"articles/#{@edit_article.id}"
  end

  delete '/articles/:id' do
    @item_to_delete = Article.all.find_by(id: params[:id]).delete
    redirect :articles
  end

end
