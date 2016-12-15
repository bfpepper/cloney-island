require 'rails_helper'


describe 'As a user' do 
  context 'when I visit a category' do 
    scenario 'I can see all associated projects' do 
      category = create_list(:category, name: 'Computer Science')
      projects = create_list(:project, 3, category_id: category.id) 


    end 
   end 
  end 
