class Area < ActiveRecord::Base
  acts_as_nested_set
  default_scope order: 'lft ASC'

  has_many :villas

  scope :for_home_page, -> { where(show_on_home_page: true) }
  scope :phuket, -> { where(name: "Phuket").first.children }
  scope :bali, -> { where(name: "Bali").first.children }
  scope :samui, -> { where(name: "Koh Samui").first.children }
  scope :for_rent, -> { where(rental: true) }
  scope :for_sale, -> { where(sale: true) }

  def self_and_descendants_villas
    self_and_descendants.map(&:villas).flatten[0..7]
  end

  def pretty_name
    ancestor_chain = self.ancestors.inject("") do |name, ancestor|
      name += "#{ancestor.name} -> "
    end
    ancestor_chain + "#{name}"
  end

  def left_position
    read_attribute(:left)
  end
end
