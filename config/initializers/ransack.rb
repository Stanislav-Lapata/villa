Ransack.configure do |config|
  config.add_predicate('place_eq',
                       arel_predicate: 'in',
                       formatter: proc { |v| Area.find(v).self_and_descendants.pluck(:id) },
                       validator: proc { |v| v.present? },
                       type: :integer)
end
