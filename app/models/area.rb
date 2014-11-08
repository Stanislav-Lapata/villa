class Area < ActiveRecord::Base
  acts_as_nested_set
  default_scope order: 'lft ASC'

  has_many :villas

  scope :phuket_self, -> { where(name: "Phuket").first }
  scope :bali_self, -> { where(name: "Bali").first }
  scope :samui_self, -> { where(name: "Koh Samui").first }

  scope :for_home_page, -> { where(show_on_home_page: true) }
  scope :phuket, -> { phuket_self.children }
  scope :bali, -> { bali_self.children }
  scope :samui, -> { samui_self.children }
  scope :for_rent, -> { where(rental: true) }
  scope :for_sale, -> { where(sale: true) }

  def pretty_name
    ancestor_chain = self.ancestors.inject("") do |name, ancestor|
      name += "#{ancestor.name} -> "
    end
    ancestor_chain + "#{name}"
  end

  def left_position
    read_attribute(:left)
  end

  def to_param
    "#{id}-#{name}"
  end
end
