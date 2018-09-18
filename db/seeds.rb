# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all

  users = User.create!([
    {fname: 'Austin', lname: 'Cotant', dob: '5/5/1991', admin: true, gender: 'M',
      email: 'austin@email.com' , phone: '6087726844', password: 'password' },
    {fname: 'Kim', lname: 'Cotant', dob: '2/10/1956', admin: false,
      email: 'kim@email.com' , phone: '6082123921', password: 'password' }
    ])

  Post.destroy_all

  posts = Post.create!([
    {body: "I like running", user_id: users.first.id},
    {body: "Magic is fun", user_id: users.first.id},
    {body: "I like running", user_id: users[1].id}
    ])

  Comment.destroy_all
  comments = Comment.create!([
    {body: 'Hey me too!', user_id: users[1].id,
      commentable_type: 'Post', commentable_id: posts.first.id},
    {body: 'Hey me too!', user_id: users[0].id,
      commentable_type: 'Post', commentable_id: posts[2].id}
    ])

end
