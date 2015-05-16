# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  ['Plant A Tree', 40],
  ['Solar Panel', 60],
  ['Water Filter', 75],
  ['Pair Of Goats', 125],
  ['Kids Club', 220],
  ['House Restoration', 240],
  ['Roof Repair', 450],
  ['Build Latrines', 1,500],
  ['Build A Home', 6,600],
].each do |ary|
  puts "Processing project type: #{ary.join(', ')}"
  ChooseProjectType.create_with(price: ary[1]).find_or_create_by(description: ary[0])
end