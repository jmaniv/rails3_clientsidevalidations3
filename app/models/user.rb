class User < ActiveRecord::Base
  attr_accessible :name, :customer_id, :active
  
  validates :name, :presence =>  { :message => "Must be filled" }
  
  # scope: The default value for active column is 'true'.
  #        Problem existing in both MySQL and PostgreSQL database.
  validates :name, :uniqueness => { :message => "Already exists", :scope => :active }
  
  # case_sensitive: Problem existing in MySQL database.
  validates :name, :uniqueness => { :case_sensitive => true, :message => "Already exists" }
end
