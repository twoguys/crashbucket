class Report < ActiveRecord::Base
  belongs_to :app, :counter_cache => true  
  
  validates_presence_of :os_version
  validates_presence_of :device
  validates_presence_of :app_version
  validates_presence_of :exc_name
  validates_presence_of :exc_reason
  validates_presence_of :backtrace
  validates_presence_of :fingerprint
  
  validates_uniqueness_of :fingerprint, :scope => :app_id
  
  #after_initialize :generate_fingerprint
  before_create :generate_fingerprint
  
  scope :open,    where("state = ?", "open")
  scope :closed,  where("state = ?", "closed")
  
  attr_accessor :bundle_identifier
  
  state_machine :state, :initial => :open do
    state :open
    state :closed
    
    after_transition :on => :reopen, :do => :deliver_email
    
    event :close do
      transition :open => :closed
    end
    
    event :reopen do
      transition :closed => :open
    end
  end
  
  def self.per_page; 10; end  
  
  def deliver_email
    Notifications.crash(self).deliver
  end
  
  def generate_fingerprint
    salt = "#{self.exc_name}#{self.backtrace}".gsub(/0x(.*)[\t\s\n]/, "")
    self.fingerprint = Digest::MD5.hexdigest(salt) unless self.fingerprint
  end
  
  def backtrace_html
    self.backtrace.gsub(/\n/, "<br />").gsub(/\t/, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
  end
  
  def validate
    if self.new_record?
      errors.add(:bundle_identifier, "is invalid") unless app.bundle_identifier == self.bundle_identifier
    end
  end
  
end
