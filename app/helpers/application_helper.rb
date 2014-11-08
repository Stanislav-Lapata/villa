# encoding: utf-8
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

  def site
    if I18n.locale == :en
      'Luxury Villas for Sale and Rent'
    else
      'Аренда и продажа вилл'
    end
  end

  def rentals
    if I18n.locale == :en
      'Rentals'
    else
      'Аренда вилл на Пхукете'
    end
  end

  def sales
    if I18n.locale == :en
      'Rentals'
    else
      'Продажа вилл на Пхукете'
    end
  end

  def car_rentals
    if I18n.locale == :en
      'Cars'
    else
      'Аренда машин на Пхукете'
    end
  end

  def yacht_rentals
    if I18n.locale == :en
      'Yachts'
    else
      'Аренда яхт на Пхукете'
    end
  end

  def contact
    if I18n.locale == :en
      'Contact'
    else
      'Контакты'
    end
  end

  def faq
    if I18n.locale == :en
      'FAQ'
    else
      'Часто задаваемые вопросы'
    end
  end

  def home
    if I18n.locale == :en
      'Home'
    else
      'Главная'
    end
  end

  def sort_by_select_values
    [
      ['Price (low)', 'price asc'],
      ['Price (high)', 'price desc'],
      ['Bedrooms (min)', 'bedrooms asc'],
      ['Bedrooms (max)', 'bedrooms desc'],
    ]

    [
      [I18n.t(:price_low, scope: 'villas'), 'price asc'],
      [I18n.t(:price_high, scope: 'villas'), 'price desc'],
      [I18n.t(:bedrooms_min, scope: 'villas'), 'bedrooms asc'],
      [I18n.t(:bedrooms_max, scope: 'villas'), 'bedrooms desc'],
    ]
  end
end
