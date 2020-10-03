#Placeholder for a model

class Article < ActiveRecord::Base
  attr_accessor :title, :content
  
  def initalize(params)
    @title = params[:title]
    @content = params[:content]
  end  
  
  
end