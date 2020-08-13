puts 'wiping database'

Member.destroy_all
Group.destroy_all
Participation.destroy_all
Meetup.destroy_all
User.destroy_all

puts 'Rebuilding Database'
  john = User.new
  john.email = "john@smith.com"
  john.password = 'password'
  john.first_name = "John"
  john.last_name = "Smith"
  john.save

  jane = User.new
  jane.email = "jane@smith.com"
  jane.password = 'password'
  jane.first_name = "Jane"
  jane.last_name = "Smith"
  jane.save

  thomas = User.new
  thomas.email = "thomas@cook.com"
  thomas.password = 'password'
  thomas.first_name = "Thomas"
  thomas.last_name = "Cook"
  thomas.save

  richard = User.new
  richard.email = "richard@brandson.com"
  richard.password = 'password'
  richard.first_name = "Richard"
  richard.last_name = "Brandson"
  richard.save

  simon = User.new
  simon.email = "simon@cowell.com"
  simon.password = 'password'
  simon.first_name = "Simon"
  simon.last_name = "Cowell"
  simon.save

  meetup1 = Meetup.new
  meetup1.host = john
  meetup1.date = DateTime.strptime("09/14/2020 8:00", "%m/%d/%Y %H:%M")
  meetup1.time = "8:00"
  meetup1.additional_info = "Going to the park for a kick about"
  meetup1.save

  meetup2 = Meetup.new
  meetup2.host = jane
  meetup2.date = DateTime.strptime("10/14/2020 9:00", "%m/%d/%Y %H:%M")
  meetup2.time = "9:00"
  meetup2.additional_info = "Sleepover at mine"
  meetup2.save

  meetup3 = Meetup.new
  meetup3.host = thomas
  meetup3.date = DateTime.strptime("11/14/2020 10:00", "%m/%d/%Y %H:%M")
  meetup3.time = "10:00"
  meetup3.additional_info = "Dinner at Nandos"
  meetup3.save

  meetup4 = Meetup.new
  meetup4.host = simon
  meetup4.date = DateTime.strptime("12/14/2020 11:00", "%m/%d/%Y %H:%M")
  meetup4.time = "11:00"
  meetup4.additional_info = "Walk around the park"
  meetup4.save

  participation1 = Participation.new
  participation1.user = jane
  participation1.meetup = meetup1
  participation1.save

  participation2 = Participation.new
  participation2.user = simon
  participation2.meetup = meetup1
  participation2.save

  participation3 = Participation.new
  participation3.user = john
  participation3.meetup = meetup2
  participation3.save

  group1 = Group.new
  group1.host = richard
  group1.save

  group2 = Group.new
  group2.host = simon
  group2.save

  group3 = Group.new
  group3.host = john
  group3.save

  member1 = Member.new
  member1.user = simon
  member1.group = group1
  member1.save

  member2 = Member.new
  member2.user = thomas
  member2.group = group1
  member2.save

  member3 = Member.new
  member3.user = jane
  member3.group = group1
  member3.save

puts 'Finished!'
