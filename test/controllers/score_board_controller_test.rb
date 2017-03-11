require 'test_helper'

class ScoreBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get score_board_index_url
    assert_response :success
  end

end
