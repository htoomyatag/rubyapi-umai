require_relative './base.rb'

class Post < Base
  attr_accessor :id, :name

  def initialize(id: nil, name: nil)
    @id = id
    @name = name
  end
end
