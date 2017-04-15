pic_list = ["user1.jpeg", "user2.jpeg", "user3.jpeg", "user4.jpeg", "user5.jpeg", "user6.jpeg"]

pic_list.each do |pic|
  Author.create({ name: Faker::Book.author,
                  pic: pic_list.sample,
                  about: Faker::Hipster.paragraph,
                  email: Faker::Internet.email,
                  password: "password",
                  password_confirmation: "password"
                  })
end

image_list = ["royaldinette1.jpg", "hanakago1.jpg", "kaya1.jpg", "rokurinsha1.jpg", "soirette1.jpg", "sushikanesaka1.jpg", "bella1.jpg", "mink1.jpg", "ginger1.jpg", "laduree1.jpg"]

image_list.each do |image|
  Post.create({ title: Faker::Book.title,
                  body: Faker::Hipster.paragraph(50),
                  likes: rand(500),
                  image: image,
                  author_id: Author.all.sample.id
                  })
end

posts = Post.all

posts.each do |p|
 rand(0..10).times do
   p.comments.create({
     body: Faker::Hipster.paragraph,
     name: Faker::Book.author
     })
 end
end
