require 'faker'

User.destroy_all
JobPosting.destroy_all
JobApplication.destroy_all
Bookmark.destroy_all
Filter.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    new_name = Faker::Name.unique.name
    new_username = new_name.downcase.gsub(/\s+/,"") + "123"
    User.create(
        name: new_name, 
        job_title: Faker::Job.title, 
        city: Faker::Address.city, 
        username: new_username, 
        password: "password")
end


20.times do 
    JobPosting.create(
        company: Faker::Company.name,
        position: Faker::Job.title, 
        city: Faker::Address.city, 
        description: Faker::Company.bs) 
end

# 10.times do 
#     Filter.create(
#         industry: Faker::Company.industry,
#         position: Faker::Job.title)
# end


# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 1)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 2)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 3)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 4)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 5)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 6)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 7)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 8)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 9)
# JobApplication.create(status: 'open', description: Faker::Company.bs, job_posting_id: 10)