require 'rails_helper'

feature 'Comments:' do

  before do
    upload_picture
    visit '/pictures'
    click_link 'Park_pic'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'Nice pic!'
    click_button 'Leave comment'
  end

  scenario 'users can leave comments on pictures' do
    expect(page).to have_content 'Nice pic!'
  end

  scenario 'user can delete a comment' do
    click_link 'Delete comment'
    expect(page).not_to have_content 'Nice pic!'
  end


end
