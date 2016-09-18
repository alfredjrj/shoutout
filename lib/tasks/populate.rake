require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    120.times do |n|
      desc "Fill database with sample data" 
      gender = ['male','female'] 
      name  = Faker::Company.name
      username = Faker::Name.name  
      email = Faker::Internet.email
      user_id = rand(1000000)
      dob = Faker::Number.between(1985,2005).to_s + "/12/22"
      user = User.create!(:name => name,
                    :username => username,
                    :email => email,
                    :gender => gender.sample,
                    :dob => dob,
                    :id =>  user_id,
                    :password => "alfred1992",
                    :password_confirmation => "alfred1992",
                    :image => Faker::Avatar.image,
                    :image_file_name => name + 'jpg' ,
                    )
       user.image.reprocess!
       Profile.create!(:user_id =>  user_id)
     
    end
  end
end