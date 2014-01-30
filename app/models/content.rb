class Content < ActiveRecord::Base
  extend Enumerize

  validates :kind, uniqueness: true

  enumerize :kind, in: [:home, :home_rentals, :home_sales, :home_yachts, :home_cars,
                        :rentals, :sales, :yachts, :cars, :estate_rentals, :estate_sales]

  class << self
    Content.kind.values.each do |kind|
      define_method kind do
        content = find_by(kind: kind)
        if I18n.locale == :ru
          content.try(:value_ru)
        else
          content.try(:value)
        end
      end

      define_method "#{kind}_keywords" do
        content = find_by(kind: kind)
        if I18n.locale == :ru
          content.try(:keywords_ru)
        else
          content.try(:keywords)
        end
      end

      define_method "#{kind}_description" do
        content = find_by(kind: kind)
        if I18n.locale == :ru
          content.try(:description_ru)
        else
          content.try(:description)
        end
      end
    end
  end
end
