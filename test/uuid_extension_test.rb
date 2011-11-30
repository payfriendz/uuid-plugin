require 'test_helper'

class UuidExtensionTest < ActiveSupport::TestCase
  test "should add an id on initialize" do
    dummy = DummyWithUuidExtension.new
    assert_not_nil dummy.id
    dummy.save
    assert_not_nil dummy.id
  end

  test "should keep same id on save" do
    dummy = DummyWithUuidExtension.new
    id = dummy.id
    dummy.save
    assert_equal id, dummy.id
  end

  test "should add an before create callback" do
    assert DummyWithUuidExtension._initialize_callbacks.detect {|callback| callback.filter == :set_id}
  end
end
