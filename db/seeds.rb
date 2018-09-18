# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Post.destroy_all
  Comment.destroy_all
  Like.destroy_all

  austin = User.create!({fname: 'Austin', lname: 'Cotant', dob: '5/5/1991', admin: true, gender: 'M',
      email: 'austin@email.com' , phone: '6087726844', password: 'password' })

  oscar = User.create!({fname: 'Oscar', lname: 'The_Grouch', dob: '10/11/1969', admin: false,
      email: 'oscar@email.com' , phone: '8727422699', password: 'sesamest' })

  diana = User.create!({fname: 'Diana', lname: 'Dianoga', dob: '1/1/1', admin: false,
      email: 'vodran@email.com' , phone: '1332847827', password: 'starwars' })

  posts = Post.create!([
    {body: "I like running", user_id: austin.id},
    {body: "Magic is fun", user_id: austin.id},
    {body: "Scram", user_id: oscar.id},
    {body: "I think there's something alive in here", user_id: diana.id}
    ])

  comments = Comment.create!([
    {body: 'I like to run to my trash can', user_id: oscar.id,
      commentable_type: 'Post', commentable_id: posts.first.id},
    {body: 'Hey me too!', user_id: austin.id,
      commentable_type: 'Post', commentable_id: posts.first.id}
    ])

  likes = Like.create!([
    {user_id: users.first.id, likeable_type: :Post, likeable_id: posts.first.id}
    ])

end
