class Area < ActiveRecord::Base
  acts_as_nested_set
  default_scope order: 'lft ASC'

  has_many :villas

  scope :for_home_page, -> { where(show_on_home_page: true) }

  def self_and_descendants_villas
    self_and_descendants.map(&:villas).flatten
  end
end
