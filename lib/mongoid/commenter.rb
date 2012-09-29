module Mongoid::Commenter
  extend ActiveSupport::Concern
  included do |base|
    base.has_many :comments
    base.index [['comments', Mongo::ASCENDING]]
  end

  def comments_list(sort = :asc)
    if Comment.respond_to? sort
      comments.send(sort, :path)
    else
      raise ArgumentError, "Wrong Argument"
    end
  end
  
end
