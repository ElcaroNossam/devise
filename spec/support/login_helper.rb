def login(number, password)
    visit root_path
    click_link "Doctor Log In!"
    fill_in :doctor_number, with: number
    fill_in :doctor_password, with: password
    click_button logout_path
  end