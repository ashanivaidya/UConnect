class Student < ActiveRecord::Base
  has_many :educations, dependent: :destroy
  has_one :score, dependent: :destroy
  has_many :student_applications, dependent: :destroy
  accepts_nested_attributes_for :educations, :score, :student_applications, allow_destroy: true
  belongs_to :user, :foreign_key=> :email_id, :primary_key => :email
end
