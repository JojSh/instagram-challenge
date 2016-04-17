require 'rails_helper'

feature 'Pictures:' do
  context 'no pictures should be added yet:' do
    scenario 'should prompt user to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures to display'
      expect(page).to have_link 'Upload a picture'
    end
  end


  context 'uploading pictures:' do

    scenario 'display uploaded pictue' do
      visit '/pictures'
      click_link 'Upload a picture'
      fill_in ('Name'), with: 'Park_pic'
      #p "PUTSING..."
      #puts page.html
      attach_file 'picture[image]', Rails.root + 'spec/support/uploads/test_pic.png'
      click_button 'Anything'
      expect(page).to have_xpath("//img[contains(@src, 'test_pic.png')]")
      expect(page).not_to have_content 'No pictures to display'
      expect(current_path).to eq '/pictures'
     end

  end

end
