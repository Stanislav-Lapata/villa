%w[ru co.uk].each do |domain|
  SitemapGenerator::Sitemap.default_host = "http://phuketrenthouse.#{domain}"
  SitemapGenerator::Sitemap.filename = "sitemap-#{domain}"
  SitemapGenerator::Sitemap.create do
    add villas_path
    add sales_path
    add yacht_rentals_path
    add car_rentals_path
    add real_estate_rentals_path
    add real_estate_sales_path

    Villa.find_each do |villa|
      add villa_path(villa), lastmod: villa.updated_at if villa.rental?
      add sale_path(villa), lastmod: villa.updated_at if villa.sale?
      add yacht_path(villa), lastmod: villa.updated_at if villa.yacht_rentals?
      add car_path(villa), lastmod: villa.updated_at if villa.car_rentals?
    end
  end
end
