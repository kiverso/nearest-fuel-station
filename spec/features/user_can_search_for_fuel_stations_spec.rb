require 'rails_helper'

describe "user can search for fuel stations" do
  it "can search for fuel station" do
    visit '/'
    select 'Turing', from: :location
    click_button 'Find Nearest Station'

    expect(current_path).to eq(search_path)
    expect(page).to have_content('Seventeenth Street Plaza')
    expect(page).to have_content('1225 17th St., Denver, CO 80202')
    expect(page).to have_content('ELEC')
    expect(page).to have_content('MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
    expect(page).to have_content('0.1 miles')
    expect(page).to have_content('travel time: 00:00:40')
    expect(page).to have_content("Start out going southeast on 17th St toward Larimer St/CO-33.")
    expect(page).to have_content("1225 17TH ST is on the right.")
  end
end