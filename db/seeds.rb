# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |p|
  project = Project.create(title: "Project #{p}")
  project.save
  10.times do |t|
    todo = project.todos.create(name: "Todo #{p} - #{t}", )
    todo.save
  end
end