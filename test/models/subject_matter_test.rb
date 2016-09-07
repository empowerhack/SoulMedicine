require 'test_helper'

class SubjectMatterTest < ActiveSupport::TestCase
  test "subject matter attirbutes must not be empty" do
    sm = SubjectMatter.new
    assert sm.invalid?, "subject matter is invalid"
    assert sm.errors[:name].any?, "subject matter has no name"
    assert sm.errors[:description].any?, "subject matter has no description"
    assert sm.errors[:order].any?, "subject matter has no order"
    assert sm.errors[:course_id].any?, "subject matter has no course"
    assert_not sm.save, "subject matter saved with no attributes provided"
  end
  test "two subject matters cannot exist in the same course with the same name" do
    sm = SubjectMatter.where(:name => "Subject 1").first
    dup = SubjectMatter.new(:name => sm.name, :course_id => sm.course_id, :description => sm.description, :order => 2)
    assert_equal "Subject 1", sm.name
    assert_not dup.save, "duplicate subject matter saved"
  end
end
