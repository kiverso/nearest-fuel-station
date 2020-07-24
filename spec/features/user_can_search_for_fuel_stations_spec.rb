require 'rails_helper'

describe "user can search for fuel stations" do
  it "can search for fuel station" do
    visit '/'
    select 'Turing', from: :location
    click_button 'Find Nearest Station'

    expect(current_path).to eq(search_path)
  end
end