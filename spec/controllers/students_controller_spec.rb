require 'spec_helper'
require 'rails_helper'
require_relative '../support/devise'

if RUBY_VERSION >= '2.6.0'
if Rails.version < '5'
  class ActionController::TestResponse < ActionDispatch::TestResponse
    def recycle!
      # @mon_mutext_owner_object_id = nil
      # @mon_mutex = nil
      # initialize
    end
  end
end
end

describe StudentsController, type: :controller do
  describe "A student should be able to login" do
    login_student

    context "From Login Student" do
      it "should return 200 OK Status" do
        expect(response).to have_http_status(:success)
      end

    end
  end

  describe "An Admin should be able to login" do
    login_admin

    context "From Login Admin" do
      it "should return 200 OK Status" do
        expect(response).to have_http_status(:success)
      end

    end
  end

  describe "A Faculty should be able to login" do
    login_faculty

    context "From Login Facluty" do
      it "should return 200 OK Status" do
        expect(response).to have_http_status(:success)
      end

    end
  end
end

describe StudentsController do
  describe 'Showing list of students' do
    it 'should render index template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      get :index
      expect(response).to render_template('index')
    end
    it 'should make a list of students available to the template' do
      get :index
      expect(assigns(:students))
    end
  end
  describe 'Showing details on particular student' do
    it 'should render the details template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      Student.create(:first_name => 'sam', :last_name => 'farmer', :age => 20, :email_id => 'sam@k.com', :phone => 'sam', :address => 'westgate 3hd',
                                       :city => 'Iowa city', :state => 'IA', :country => 'USA' )
      get :details, {:id => 1}
      expect(response).to render_template('details')
    end
    it 'should make a specific student available to the template' do
      get :details, {:id => 1}
      expect(assigns(:student))
    end
  end
  describe 'Creating a new student' do

  end
  describe 'Searching for university information' do
    it 'should render the show template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      Student.create(:first_name => 'sam', :last_name => 'farmer', :age => 20, :email_id => 'user@gmail.com', :phone => 'sam', :address => 'westgate 3hd',
                     :city => 'Iowa city', :state => 'IA', :country => 'USA' )
      allow(StudentsController).to receive(:search_collegeapi).and_return( {} )
      post :show, {:search_terms => 'hh'}
      expect(response).to render_template('show')
    end
    it 'should return the results of the search to the template' do
      post :show
      expect(assigns(:universities))
    end
  end
  describe 'Sorting the table of students' do
    it 'should change the order of students returned based on the sort criteria' do
      get :index, {:order => :gpa}
      students = assigns(:students)
      get :index, {:order => :age}
      expect(assigns(:students) != students)
    end
  end
  describe 'Calculating percentile information' do
    it 'should provide the view with ranking information' do
      get :show
      expect(assigns(:gpa_rank))
      expect(assigns(:act_rank))
    end
  end
end