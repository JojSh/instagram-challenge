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
    end

    #  scenario 'delete uploaded picture' do
    #   #  click_link 'Park_pic'
    #    click_link 'Delete Park_pic'
    #    expect(page).not_to have_xpath("//img[contains(@src, 'test_pic.png')]")
    #    expect(page).to have_content 'No pictures to display'
    #    expect(page).not_to have_content 'A nice day out'
    #    expect(current_path).to eq '/pictures'
    #  end

  end
end
