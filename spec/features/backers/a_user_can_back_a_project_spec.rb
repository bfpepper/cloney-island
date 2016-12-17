require 'rails_helper'

describe "As a user" do
 context "when I visit a projects show page" do 
  scenario "I can back(give money) to a project" do 
      user = create(:user)
      role = Role.create(name: "registered")
      user.roles << role
  
    end 
  end 
end 




#as a registered user
#when i visit project show page
#I can click on "back project"
#I am directed to project backers page
#I fill in the amount
#I fill in passwordword
#I click on submit project
#I am redirected to project show page
