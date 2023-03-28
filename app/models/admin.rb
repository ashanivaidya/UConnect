class Admin < ActiveRecord::Base
  belongs_to :user, :foreign_key=> :email_id, :primary_key => :email
end