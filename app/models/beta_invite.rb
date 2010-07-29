class BetaInvite < ActiveRecord::Base

  validates_presence_of   :email
  validates_uniqueness_of :email
  
  before_create           :generate_code
  
  def self.deliver_invites(num)
    BetaInvite.where("sent_at IS NULL").limit(num).each { |invite| invite.deliver }
  end
  
  def deliver
    Notifications.beta_invite(self).deliver
    self.update_attribute(:sent_at, Time.now)
  end
  
  def generate_code
    self.code = Digest::SHA1.hexdigest("#{Time.now}#{rand(938249832749)}")
  end
  
  
end
