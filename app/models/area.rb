class Area < ActiveRecord::Base
  extend Enumerize

  acts_as_nested_set
  default_scope order: 'lft ASC'

  has_many :villas

  scope :for_home_page, -> { where(show_on_home_page: true) }

  enumerize :category, in: [:rental, :sale], default: :rental
end
