require "rails_helper"

describe "Home page" do
  it "doesn't show the Rule guess or Bias if a guess hasn't been submitted.", :points => 0 do
    visit "/"
    
    expect(page).not_to have_content("Your guess was:")
    expect(page).not_to have_css("h2", text: "Bias")
  end
end

describe "Home page" do
  it "doesn't show the Sequence guess if a guess hasn't been submitted.", :points => 0 do
    visit "/"
    
    expect(page).not_to have_content("Your guesses:")
    expect(page).not_to have_content("Yes!")
    expect(page).not_to have_content("No.")
  end
end

describe "Home page" do
  it "has at least one form", :points => 0 do
    visit "/"
    
    expect(page).to have_css("form", minimum: 1)
  end
end

describe "Home page [Sequence Guess Form]" do
  it "has a label with the text 'First number'", :points => 0, hint: h("copy_must_match label_for_input") do
    visit "/"

    expect(page).to have_css("label", text: "First number")
  end
end

describe "Home page [Sequence Guess Form]" do
  it "has a label with the text 'Second number'", :points => 0, hint: h("copy_must_match label_for_input") do
    visit "/"

    expect(page).to have_css("label", text: "Second number")
  end
end

describe "Home page [Sequence Guess Form]" do
  it "has a label with the text 'Third number'", :points => 0, hint: h("copy_must_match label_for_input") do
    visit "/"

    expect(page).to have_css("label", text: "Third number")
  end
end

describe "Home page [Sequence Guess Form]" do
  it "has a button with the text 'Check'", :points => 0, hint: h("copy_must_match") do
    visit "/"

    expect(page).to have_css("button", :text => "Check", :minimum => 1)
  end
end

describe "Home page [Sequence Guess Form]" do
  it "has a form to enter a sequence of numbers that submits", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "First number", with: "1"
    fill_in "Second number", with: "2"
    fill_in "Third number", with: "3"

    button = page.find("form input + button")
    button.click

    expect(page.status_code).to be 200
  end
end

describe "Home page [Sequence Guess Form]" do
  it "enter a sequence of numbers form redirect to right route", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "First number", with: "1"
    fill_in "Second number", with: "2"
    fill_in "Third number", with: "3"

    button = page.find("form input + button")
    button.click

    expect(page.current_path).to eq("/").or(eq("/a-quick-puzzle"))
  end
end

describe "Home page [Sequence Guess Form]" do
  it "enter a sequence of numbers form displays data entered on next page.", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "First number", with: "1"
    fill_in "Second number", with: "2"
    fill_in "Third number", with: "3"

    button = page.find("form input + button")
    button.click

    expect(page).to have_content("1")
    expect(page).to have_content("2")
    expect(page).to have_content("3")
  end
end

describe "Home page [Sequence Guess Form]" do
  it "enter a sequence of numbers form displays 'Yes!' when the data entered follows the rule.", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "First number", with: "2"
    fill_in "Second number", with: "4"
    fill_in "Third number", with: "8"

    button = page.find("form input + button")
    button.click

    expect(page).to have_content("2")
    expect(page).to have_content("4")
    expect(page).to have_content("8")
    expect(page).to have_content("Yes!")
  end
end

describe "Home page [Sequence Guess Form]" do
  it "enter a sequence of numbers form displays 'No.' when the data entered follows the rule.", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "First number", with: "8"
    fill_in "Second number", with: "4"
    fill_in "Third number", with: "2"

    button = page.find("form input + button")
    button.click
    
    expect(page).to have_content("8")
    expect(page).to have_content("4")
    expect(page).to have_content("2")
    expect(page).to have_content("No.")
  end
end

describe "Home page [Sequence Guess Form]" do
  it "displays every sequrence entered", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "First number", with: "6"
    fill_in "Second number", with: "12"
    fill_in "Third number", with: "24"
    
    button = page.find("form input + button")
    button.click
    
    fill_in "First number", with: "10"
    fill_in "Second number", with: "100"
    fill_in "Third number", with: "10000"
    button = page.find("form input + button")
    button.click

    expect(page).to have_content("6")
    expect(page).to have_content("12")
    expect(page).to have_content("24")
    expect(page).to have_content("10")
    expect(page).to have_content("100")
    expect(page).to have_content("10000")
  end
end

describe "Home page" do
  it "has at least two forms (Sequence Guess Form and Rule Guess Form)", :points => 0 do
    visit "/"

    expect(page).to have_css("form", minimum: 2)
  end
end


describe "Home page" do
  it "has two buttons with the text 'Check'", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    expect(page).to have_css("button", :text => "Check", :minimum => 2)
  end
end

describe "Home page [Rule Guess Form]" do
  it "has a label with the text 'My guess at the rule'", :points => 0, hint: h("copy_must_match label_for_input") do
    visit "/"

    expect(page).to have_css("label", text: "My guess at the rule")
  end
end

describe "Home page [Rule Guess Form]" do
  it "is beneath the Sequence form and submits to a valid route.", :points => 0, hint: h("copy_must_match") do
    visit "/"

    button = page.all("form button").last
    button.click

    expect(page.status_code).to be 200
  end
end

describe "Home page [Rule Guess Form]" do
  it "redirects to right route upon submitting.", :points => 0 do
    visit "/"

    button = page.all("form button").last
    button.click

    expect(page.current_path).to eq("/").or(eq("/a-quick-puzzle"))
  end
end

describe "Home page [Rule Guess Form]" do
  it "displays the guess entered after submitting.", :points => 0, hint: h("copy_must_match") do
    visit "/"
    
    fill_in "My guess at the rule", with: "Don't talk about fight club."

    button = page.all("form button").last
    button.click

    expect(page).to have_content("Don't talk about fight club.")

  end
end

describe "Home page [Rule Guess Form]" do
  it "does show the Rule guess or Bias if a guess has been submitted.", :points => 0 do
    visit "/"
    
    fill_in "My guess at the rule", with: "Don't talk about fight club."

    button = page.all("form button").last
    button.click

    expect(page).to have_content("Your guess was:")
    expect(page).to have_css("h2", text: "Bias")
  end
end
