SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :house_rentals, t('navigation.house_rentals'), villas_path
    primary.item :house_sales, t('navigation.house_sales'), sales_path
    primary.item :yacht_rentals, t('navigation.yacht_rentals'), yacht_rentals_path
    primary.item :car_rentals, t('navigation.car_rentals'), car_rentals_path
  end
end
