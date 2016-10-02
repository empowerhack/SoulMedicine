require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "cannot save without name" do
    c = Course.new(name: nil)
    assert_not c.save
  end
  test "course attirbutes must not be empty" do
    c = Course.new
    assert c.invalid?, "course is invalid"
    assert c.errors[:name].any?, "course has no name"
    assert c.errors[:description].any?, "course has no description"
    assert c.errors[:order].any?, "course has no order"
    assert_not c.save, "course saved with no attributes provided"
  end
  test "two courses cannot have the same name" do
    d = Course.new(:name => "Course Uno", :description => "ABC Course", :order => 1)
    assert_not d.save, "duplicate course saved"
  end
end
