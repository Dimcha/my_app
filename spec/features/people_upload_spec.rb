require 'rails_helper'

RSpec.feature 'People upload', type: :feature do
  it 'should upload file and display result table', js: true do
    puts root_path
    visit(root_path)

    click_on('Upload People')

    attach_file('Upload CSV file', Rails.root.join('spec', 'fixtures', 'people.csv'))
    click_on('Upload')

    expect(page).to have_css 'table'

    within('table') do
      expect(page).to have_xpath(".//tr", :count => 6)
    end

    expect(find(:xpath, '/html/body/div/div/table/tbody/tr[4]/td[6]')).to have_content('Email is invalid, Phone is invalid')
    expect(find(:xpath, '/html/body/div/div/table/tbody/tr[5]/td[6]')).to have_content("Last name can't be blank")


    find(:xpath, '/html/body/div/div/table/tbody/tr[4]/td[4]/input').set('bo@example.com')
    find(:xpath, '/html/body/div/div/table/tbody/tr[4]/td[5]/input').set('+987654321')
    find(:xpath, '/html/body/div/div/table/tbody/tr[4]/td[7]/button').click


    find(:xpath, '/html/body/div/div/table/tbody/tr[5]/td[3]/input').set('Tyson')
    find(:xpath, '/html/body/div/div/table/tbody/tr[5]/td[7]/button').click

    sleep 5

    expect(page).not_to have_content('Save')
  end
end
