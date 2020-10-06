
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #create new form to create a new article
  get "/articles/new" do
    erb :new
  end

  #create(post)
  #redirects to index, to veiw all articles
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

    get '/articles' do
      binding.pry
    end

end
