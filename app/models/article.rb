#Placeholder for a model
class Article < ActiveRecord::Base

  attr_accessor :title, :content

  @@articles = []

  def initialize(title:, content:)

    @@articles << self
  end

end
