# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
        name: 'karan',
        email: 'karan@gmail.com',
        password_digest: '123'
    }
])

ads = Ad.create([
    {
        title: 'mercedes',
        body: 'cool car',
        user: users.first
    }
])

comments = Comment.create([
    {
        text: 'Nice',
        user: users.first,
        ad: ads.first
    }
])