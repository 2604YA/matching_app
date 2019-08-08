require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,"Matching App"
    assert_equal full_title("Help"), "Help | Matching App"
  end
end
