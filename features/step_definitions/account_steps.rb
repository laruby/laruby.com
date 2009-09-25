Given /^I am the registered user (.+)$/ do |login|
  params ={
    'email' => "#{login.gsub(' ', '_')}@example.com",
    'password' => 'password',
    'password_confirmation' => 'password'
  }
  @user = User.create!(params)
end

When /^I login with valid credentials$/ do
  fill_in('email', :with => @user.email)
  fill_in('password', :with => 'password')
  click_button('Login')
end