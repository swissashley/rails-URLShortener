# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
usera = User.create!(email: "1234@hotmail.com")
userb = User.create!(email: "4567@hotmail.com")
userc = User.create!(email: "9999@hotmail.com")
userd = User.create!(email: "7777@hotmail.com")

urla = ShortenedUrl.create_for_user_and_long_url!(usera, "ldksafj.com")
urlb = ShortenedUrl.create_for_user_and_long_url!(userb, "sadfsadfsda.com")
urlc = ShortenedUrl.create_for_user_and_long_url!(userc, "xzcvxcvzxcv.com")
urld = ShortenedUrl.create_for_user_and_long_url!(userd, "qweqweqwe.com")

# usera = User.find_by('email = ?', "1234@hotmail.com")
# userb = User.find_by('email = ?', "4567@hotmail.com")
# userc = User.find_by('email = ?', "9999@hotmail.com")
# userd = User.find_by('email = ?', "7777@hotmail.com")
#
# urla = ShortenedUrl.find_by('long_url = ?' , "ldksafj.com")
# urlb = ShortenedUrl.find_by('long_url = ?' , "sadfsadfsda.com")
# urlc = ShortenedUrl.find_by('long_url = ?' , "xzcvxcvzxcv.com")
# urld = ShortenedUrl.find_by('long_url = ?' , "qweqweqwe.com")

Visit.record_visit!(usera, urla)
Visit.record_visit!(usera, urla)
Visit.record_visit!(usera, urlb)
Visit.record_visit!(usera, urlc)
Visit.record_visit!(usera, urld)

Visit.record_visit!(userb, urla)
Visit.record_visit!(userb, urlb)
Visit.record_visit!(userb, urlb)
Visit.record_visit!(userb, urlc)

Visit.record_visit!(userc, urlb)
Visit.record_visit!(userc, urlc)
Visit.record_visit!(userc, urlc)
Visit.record_visit!(userc, urlc)

Visit.record_visit!(userd, urla)
Visit.record_visit!(userd, urlc)
Visit.record_visit!(userd, urld)
Visit.record_visit!(userd, urld)
