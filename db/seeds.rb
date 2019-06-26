# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  User.create(email: "l.tisha#{i}@mail.ru", password: '526409697', password_confirmation: '526409697', name: 'Ivan')
end
puts('Create Category')
Category.create([{ title: 'Работа', description: 'description' },
                 { title: 'Медицина', description: 'description' },
                 { title: 'Образование', description: 'description' },
                 { title: 'Город', description: 'description' },
                 { title: 'Дом', description: 'description' }])
puts('Create sub_categories')
Category.all.each do |i|
  i.sub_categories.create([{ title: "Подкатегория #{i.title} 1", description: 'description' },
                           { title: "Подкатегория #{i.title} 2", description: 'description' },
                           { title: "Подкатегория #{i.title} 3", description: 'description' },
                           { title: "Подкатегория #{i.title} 4", description: 'description' },
                           { title: "Подкатегория #{i.title} 5", description: 'description' }])
end
puts('Create claims')
SubCategory.all.each do |i|
  i.claims.create([{ title: "Меня обманули #{i.title} ", description: 'description', owner_id: Random.rand(10) },
                   { title: "Меня обманули #{i.title} ", description: 'description', owner_id: Random.rand(10) },
                   { title: "Меня обманули #{i.title} ", description: 'description', owner_id: Random.rand(10) },
                   { title: "Меня обманули #{i.title} ", description: 'description', owner_id: Random.rand(10) },
                   { title: "Меня обманули #{i.title} ", description: 'description', owner_id: Random.rand(10) }])
end
puts('Create comments')
Claim.all.each do |i|
  i.comments.create([{ comment_text: 'И меня обманули', user_id: Random.rand(10) },
                     { comment_text: 'Никакой проблемы нет ', user_id: Random.rand(10) },
                     { comment_text: 'И меня обманули ', user_id: Random.rand(10) },
                     { comment_text: 'Никакой проблемы нет ', user_id: Random.rand(10) },
                     { comment_text: 'И меня обманули ', user_id: Random.rand(10) }])
end
