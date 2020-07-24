require 'rails_helper'

describe "user can search for fuel stations" do
  it "can search for fuel station" do
    visit '/'
    select 'Turing', from: :location
    click_button 'Find Nearest Station'

    expect(current_path).to eq(search_path)
    expect(page).to have_content('Station Name')
    expect(page).to have_content('Station address')
    expect(page).to have_content('Station fuel types')
    expect(page).to have_content('Station access times')
    expect(page).to have_content('Distance to station: 0.1 miles')
    expect(page).to have_content('Estimated travel time: 1 minute')
    expect(page).to have_content("Turn left onto Lawrence St Destination will be on the left")
  end
end