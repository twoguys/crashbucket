class BetaInvite < ActiveRecord::Base

  validates_presence_of   :email
  validates_uniqueness_of :email
  
  before_create           :generate_code
  
  def generate_code
    self.code = Digest::SHA1.hexdigest("#{Time.now}#{rand(938249832749)}")
  end
  
end
