11.times { Post.create title: Faker::Name.title, description: Faker::Lorem.paragraph(2) }
