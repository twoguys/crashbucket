class Report < ActiveRecord::Base
  belongs_to :app
  
  validates_presence_of :os_version
  validates_presence_of :device
  validates_presence_of :app_version
  validates_presence_of :exc_name
  validates_presence_of :exc_reason
  validates_presence_of :backtrace
  validates_presence_of :fingerprint
  
  validates_uniqueness_of :fingerprint, :scope => :app_id
  
  before_create :generate_fingerprint
  
  def self.per_page; 10; end  
  
  def generate_fingerprint
    self.fingerprint = Digest::MD5.hexdigest("#{self.exc_name}#{self.backtrace}") unless self.fingerprint
  end
  
  def backtrace_html
    self.backtrace.gsub(/\n/, "<br />").gsub(/\t/, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
  end
  
end
