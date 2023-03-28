class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :github]
  has_one :student, :foreign_key=> :email_id, :primary_key=> :email
  enum role: {student: 0, faculty: 1, admin: 2}
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :student
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    provider = access_token.provider
    uid = access_token.uid
    user = User.where(email: data['email']).first


    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20],
                           uid: uid,
                           provider: provider
        )
        student = Student.create(:first_name => data['name'].split(' ')[0], :last_name => data['name'].split(' ')[1], :age => nil,
                                :email_id => data['email'], :phone => nil,
                                :address => nil, :city => nil, :state => nil, :country => nil,
                                )
    end
    user
  end


  def self.update_status(id)
    User.update(id, :status => 'Confirmed')
    #flash[:notice] =  "#{User.where("id=#{id}")} confirmed."
  end
end
