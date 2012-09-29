module Mongoid_Commentable
  module Comment
    extend ActiveSupport::Concern

    included do |base|
      base.attr_accessible :path,:parent
      base.field :path, :type => String, :default => ""
      base.field :parent, :type => String
      base.field :deleted_at, :type => Time
      base.embedded_in :commentable, :polymorphic => true, :inverse_of => :comments
      base.belongs_to :users
    end

    def level
      path.count('.')
    end

    def remove
      self.update_attribute(:deleted_at, Time.now)
    end

    def restore
      self.update_attribute(:deleted_at, nil)
    end

    def deleted?
      !!self.deleted_at
    end

    def author(attr = :name)
      if User.respond_to? attr
        user.send attr
      else
        raise ArgumentError, "User model must have #{attr} attribute"
    end
    
  end
end
