# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

sample_tags = ['javascript', 'ruby', 'unix', 'jquery', 'rails', 'sinatra', 'active record']

20.times do
  question = Question.create(content: Faker::Company.bs)
  question.tags = sample_tags.sample(2).join(",")
end



