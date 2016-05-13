# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
regions = %w(צפון שרון מרכז שפלה דרום)
regions.each do |region|
  Region.where(name: region).first_or_create
end

veg = %w(עגבניות מלפפונים פלפלים בצל תפוחים אגסים אפרסקים)
veg.each do |tag|
  ActsAsTaggableOn::Tag.where(name: tag).first_or_create
end