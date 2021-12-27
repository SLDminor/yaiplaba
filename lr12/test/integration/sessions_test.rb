require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  test 'unauthorized user will be redirected to login page' do
    get rever_enter_form_path
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post session_create_url, params: { login: Faker::Lorem.word, password: Faker::Lorem.word }
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with correct credentials will see the root' do
    password = Faker::Lorem.word

    user = User.create(name: Faker::Lorem.word, password_digest: password, last_login: DateTime.now)

    post users_url, params: { user: { login: user.name, password: password, last_login: user.last_login } }

    assert_redirected_to controller: :session, action: :login
  end

  test 'user can logout' do
    password = Faker::Lorem.word

    user = User.create(name: Faker::Lorem.word, password_digest: password, last_login: DateTime.now)

    post users_url, params: { user: { login: user.name, password_digest: password, last_login: user.last_login } }

    get session_logout_url

    get rever_enter_form_url

    assert_redirected_to controller: :session, action: :login
  end
end
