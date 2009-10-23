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

Before('@logged_in') do
  Given "I am the registered user John Doe"
  And "I am on the login page"
  And "I login with valid credentials"
end


  Given /^there is a valid proposal$/ do
    visit path_to(new_presentation_path)
    fill_in('Subject', :with => "Valid Proposal")
    fill_in('Difficulty level', :with => "Beginer")
    fill_in('Duration', :with => "30")
    fill_in('Description', :with => "Some cool stuff")
    click_button('Request')
end