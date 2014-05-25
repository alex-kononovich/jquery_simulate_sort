require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  options = {
    extensions: ['public/jquery_simulate_sort.js']
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.app_host = 'http://localhost:4567'
Capybara.run_server = false
Capybara.default_driver = :poltergeist

class TestSorting
  include Capybara::DSL

  def test_sort
    visit '/'
    
    page.driver.browser.extensions = ['public/jquery_simulate_sort.js']
    page.execute_script %{
      jquery_simulate_sort($(".documents li.fourth"), 1);
    }
    sleep 1

    # check
    puts order = all('.documents li').map { | each | each.text }
  end
  
end

TestSorting.new.test_sort
