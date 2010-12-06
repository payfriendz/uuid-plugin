require 'test_helper'

class UuidExtensionTest < ActiveSupport::TestCase
  test "should add an id before create" do
    dummy = DummyWithUuidExtension.new
    assert_nil(dummy.id)
    dummy.save
    assert_not_nil(dummy.id)
  end

  test "should add an before create callback" do
    assert DummyWithUuidExtension._create_callbacks.detect {|callback| callback.filter == :set_id}
  end
end
