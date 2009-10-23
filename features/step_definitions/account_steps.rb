Given /^I am the registered user (.+)$/ do |login|
  params ={
    'email' => "#{login.gsub(' ', '_')}@example.com",
    'password' => 'password',
    'password_confirmation' => 'password',
    'active' => true
  }
  @user = User.create!(params)
end

When /^I login with valid credentials$/ do
  fill_in('email', :with => @user.email)
  fill_in('password', :with => 'password')
  click_button('Login')
end

Before('@logged_in', '@create_presentation_valid_data', '@create_presentation_invalid_data') do
  Given "I am the registered user John Doe"
  And "I am on the login page"
  And "I login with valid credentials"
end

