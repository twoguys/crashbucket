class App < ActiveRecord::Base
  
  belongs_to            :user
  has_many              :reports

  validates_presence_of :name


  before_create         :create_api_key
  
  def self.per_page; 10; end
  
  def to_param
    "#{id} #{name}".slugify
  end
  
  def create_api_key
    self.api_key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)
  end
  
end
