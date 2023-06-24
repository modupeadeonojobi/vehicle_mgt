5.times do
  Property.create({
    property_address: Faker::Address.full_address,
    properties_type: Faker::Lorem.word,
    number_of_bedrooms: Faker::Number.number(digits: 1),
    number_of_sitting_rooms: Faker::Number.number(digits: 1),
    number_of_kitchen: Faker::Number.number(digits: 1),
    number_of_bathrooms: Faker::Number.number(digits: 1),
    number_of_toilets: Faker::Number.number(digits: 1),
    property_owner: Faker::Name.name,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
    valid_from: Faker::Date.between(from: 2.days.ago, to: Date.today),
    valid_to: Faker::Date.between(from: Date.today, to: 2.year.from_now),
  })
end