huge_sonic_fan = User.create(username: "Huge_Sonic_Fan", email: "sonic_fan@email.com", password: "sonic")
meh_sonic_fan = User.create(username: "Meh_Sonic_Fan", email: "meh@email.com", password: "meh")
rush_b = User.create(username: "Rush_B", email: "rush_b@email.com", password: "go go go")

sonic_the_hedgehog = Game.create(name: "Sonic the Hedgehog", release_date: "06/23/1991", platform: "Sega Genesis")
sonic_the_hedgehog_2nd_copy = Game.create(name: "Sonic the Hedgehog", release_date: "06/23/1991", platform: "Sega Genesis")
counter_strike = Game.create(name: "Counter-Strike", release_date: "11/09/2000", platform: "PC")
streets_of_rage_2 = Game.create(name: "Streets of Rage 2", release_date: "12/20/1992", platform: 
"Sega Genesis")

action = Genre.create(name: "Action")
platformer = Genre.create(name: "Platformer")
fps = Genre.create(name: "First Person Shooter")
beat_em_up = Genre.create(name: "Beat em Up")

sonic_the_hedgehog.genres << action 
sonic_the_hedgehog.genres << platformer 
sonic_the_hedgehog_2nd_copy.genres << action
sonic_the_hedgehog_2nd_copy.genres << platformer
counter_strike.genres << fps
streets_of_rage_2.genres << action 
streets_of_rage_2.genres << beat_em_up

rush_b.games << counter_strike
huge_sonic_fan.games << sonic_the_hedgehog 
huge_sonic_fan.games << streets_of_rage_2
meh_sonic_fan.games << sonic_the_hedgehog_2nd_copy 
meh_sonic_fan.games << counter_strike

Genre.create(name: "RPG")
Genre.create(name: "Racing")
Genre.create(name: "RTS")
Genre.create(name: "Fighting")
Genre.create(name: "Adventure")