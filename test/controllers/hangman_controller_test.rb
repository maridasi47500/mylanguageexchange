require 'test_helper'

class HangmanControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hangman_new_url
    assert_response :success
  end

end
