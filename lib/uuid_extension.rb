module UuidExtension
  extend ActiveSupport::Concern
  
  included do
    before_create :set_id
  end
  
  def set_id
    self.id ||= ::UUIDTools::UUID.random_create.to_s
  end
end
