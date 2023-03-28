require './test/test_helper'

class StudentsControllerTest < ActionController::TestCase

  test 'should render index template' do
    get :index
    assert_template('index')
  end
  test 'should make a list of students available to the template' do
    get :index
    assert_not_nil assigns(:students)
  end
  test 'should render the details template' do
    get :details, id: 1
    assert_template('details')
  end
  test 'should make a specific student available to the template' do
    get :details, id: 1
    assert_not_nil assigns(:student)
  end
  test 'should render the show template' do
    post :show
    assert_template('show')
  end
  test 'should return the results of the search to the template' do
    post :show
    assert_not_nil assigns(:universities)
  end
end