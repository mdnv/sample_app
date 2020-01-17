# frozen_string_literal: true

json.products do
  json.array!(@products) do |product|
    json.id product.id
    json.name product.name
    json.gender product.gender
    json.franchise product.franchise
    json.producttype product.producttype
    json.category product.category
    json.sport product.sport
    json.description_h5 product.description_h5
    json.description_p product.description_p
    json.specifications product.specifications
    json.care product.care
    json.image_url url_for(product.variants.first.images.first)
    json.url url_for(admin_product_path(product))
    json.url_edit url_for(edit_admin_product_path(product))
  end
end
