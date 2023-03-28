require 'spec_helper'
require 'rails_helper'
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
describe RatingsController do

  describe 'Showing list of ratings' do
    it 'should render index template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      get :index
      expect(response).to render_template('index')
    end
    it 'should make the list of rating avaible to the template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      get :index
      expect(assigns(@ratings))
    end
    it 'should render the ratings by application template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      get :show_application_ratings
      expect(response).to render_template('show_application_ratings')
    end
    it 'should make the list of ratings by application available to the template' do
      get :show_application_ratings
      expect(assigns(@ratings))
    end
    it 'should render the ratings by user template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      get :show_user_ratings
      expect(response).to render_template('show_user_ratings')
    end
    it 'should make the list of rating by user available to the template' do
      get :show_user_ratings
      expect(assigns(@ratings))
    end
  end
  describe 'Adding new rating' do
    it 'should render the new template' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      get :new
      expect(response).to render_template('new')
    end
    it 'should persist the rating to the database' do
      user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'
      sign_in user
      expect(Rating).to receive(:create)
      post :create, {rating: {rating:1}, user:{'User ID':1}, app:{'Application ID':1}}
    end
  end
end