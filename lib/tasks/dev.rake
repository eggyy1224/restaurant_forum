namespace :dev do
  task fake_restaurants: :environment do
    Restaurant.destroy_all
    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        image: File.open(Rails.root.join("seed_img/#{rand(0..4)}.jpg"))
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_users: :environment do
    User.destroy_all
    20.times do
      User.create!(email: FFaker::Internet.email,
                   password: "123456",
                   password_confirmation: "123456",
                   name: FFaker::Name.first_name)
    end
    User.create( email: "foobar@foo.bar", password: "foobar", password_confirmation:"foobar", role: "admin", 
                  name: "eggyy", intro: FFaker::Lorem.paragraph )
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_comments: :environment do
    Comment.destroy_all

    Restaurant.all.each do |restaurant|
      
      3.times do
        restaurant.comments.create!(content: FFaker::Lorem.paragraph, user_id: User.all.sample.id)
        
      end
                            
    end
    puts "have created 3 fake comment for every restaurants"
    
  end
end