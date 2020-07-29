require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"


feed_me_a_fruit

sam = BestFriend.new('', 6, '') #=> name error

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet

don = BestFriend.new('bec', 70, '') #=> argument error OR pasttime error

don.talk_about_friendship
don.do_friendstuff
don.give_friendship_bracelet

joey = BestFriend.new('', 10, 'surfing') #=> name error

joey.talk_about_friendship
joey.do_friendstuff
joey.give_friendship_bracelet

real_pal = BestFriend.new('paloma', 20, 'coding') #=> no error

real_pal.talk_about_friendship
real_pal.do_friendstuff
real_pal.give_friendship_bracelet