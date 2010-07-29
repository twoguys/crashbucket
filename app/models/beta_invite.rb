class BetaInvite < ActiveRecord::Base

  validates_presence_of   :email
  validates_uniqueness_of :email
  
  before_create           :generate_code
  
  def self.send_invites(num)
    beta_invites = BetaInvite.limit(num)
    beta_invites.each do |invite|
      Notifications.beta_invite(invite).deliver
    end
  end
  
  def generate_code
    self.code = Digest::SHA1.hexdigest("#{Time.now}#{rand(938249832749)}")
  end
  
  
end
