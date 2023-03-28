module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 2, :status => 'confirmed'
      sign_in admin
    end
  end

  def login_student
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      student = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in student
    end
  end

  def login_faculty
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      faculty = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 1, :status => 'confirmed'
      sign_in faculty
    end
  end
end