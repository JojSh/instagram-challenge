require 'rails_helper'

feature 'Comments:' do

  before { upload_picture }

  scenario 'users can leave comments on pictures' do
    visit '/pictures'
    click_link 'Park_pic'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'Nice pic!'
    click_button 'Leave comment'
    expect(page).to have_content 'Nice pic!'
  end
end
