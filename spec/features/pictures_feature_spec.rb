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

    before do
      visit '/pictures'
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Park_pic'
      attach_file 'picture[image]', Rails.root + 'spec/support/uploads/test_pic.png'
      fill_in 'Description', with: 'A nice day out'
      click_button 'Submit'
    end

    scenario 'display uploaded pictue' do
      expect(page).to have_xpath("//img[contains(@src, 'test_pic.png')]")
      expect(page).not_to have_content 'No pictures to display'
      expect(page).not_to have_content 'A nice day out'
      expect(current_path).to eq '/pictures'
     end

    context 'clicking on a picture/name:' do

      before do
        click_link 'Park_pic'
      end

      scenario 'reveals picture profile page' do
        expect(page).to have_content 'A nice day out'
        # expect(current_path).to eq '/pictures/0'
        # expect(current_path).to eq '/pictures/0'
      end

      scenario 'lets a user edit the picture' do
        click_link 'Edit picture'
        fill_in 'Name', with: 'Park Day'
        fill_in 'Description', with: 'A terrible day at the park'
        click_button 'Update picture'
        expect(page).to have_content 'Park Day'
        expect(page).to have_content 'A terrible day at the park'
      end

       scenario 'lets a user delete a picture' do
         click_link 'Delete picture'
         expect(page).not_to have_xpath("//img[contains(@src, 'test_pic.png')]")
         expect(page).not_to have_content 'Park_pic'
         expect(page).to have_content 'Picture has been deleted'
         expect(current_path).to eq '/pictures'
       end
    end



  end
end
