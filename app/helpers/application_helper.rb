module ApplicationHelper
  def price_range(villa, type)
    case type
    when 'sales'
      "#{t('villas.price_range')}: #{number_to_currency(villa.sale_price, precision: 0)}"
    when 'cars'
      "#{t('villas.price')}: #{number_to_currency(villa.car_price, precision: 0)} (#{t('villas.per_day')})"
    when 'yachts'
      "#{t('villas.price')}: #{number_to_currency(villa.yacht_price, precision: 0)} (#{t('villas.per_day')})"
    else
      "#{t('villas.price_range')}: #{number_to_currency(villa.low_night, precision: 0)} - #{number_to_currency(villa.peak_night, precision: 0)} (#{t('villas.per_night')})"
    end
  end
end
