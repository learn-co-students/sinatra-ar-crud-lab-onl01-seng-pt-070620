
require_relative '../../config/environment'

require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

#read(all articles)
get '/articles' do
  @articles = Article.all
  erb :index
end

#create(shows a form to create a new article)
get "/articles/new" do
  erb :new
end

#create(post)
#redirects to index, to view all articles
post '/articles' do
@article = Article.create(params)
redirect to "/articles/#{@article.id}"
end 
 
#read(individual articles)
get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :show
end 

#update/edit (individial artical)
get '/articles/:id/edit' do
@article = Article.find(params[:id])
  erb :edit
end 

#update/edit (patch request)
patch '/articles/:id' do
@article = Article.find(params[:id])
@article.title = params[:title]
@article.content = params[:content]
@article.save
redirect to "/articles/#{ @article.id }"
end 

#delete
delete '/articles/:id' do
  @article = Article.find(params[:id])
  @article.destroy
  redirect to '/articles'
end 

end
