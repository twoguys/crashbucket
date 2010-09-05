class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :apps, :dependent => :destroy, :order => "name ASC"
end
