Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
    @user = User.create!(attributes)
    @user.update_attribute("admin", attributes["admin"] == "true")
    @user.confirm! unless unconfirmed
  end
end

Given /^I am signed in as them$/ do
  step %Q{I am on the homepage}
  step %Q{I follow "Sign in"}
  step %Q{I fill in "Email" with "#{@user.email}"}
  step %Q{I fill in "Password" with "password"}
  step %Q{I press "Sign in"}
  step %Q{I should see "Signed in successfully."}
end

