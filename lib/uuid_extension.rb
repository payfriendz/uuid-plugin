module UuidExtension
  extend ActiveSupport::Concern
  
  included do
    after_initialize :set_id
  end
  
  def set_id
    self.id = ::UUIDTools::UUID.random_create.to_s if self.id.blank?
  end
end