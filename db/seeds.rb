huge_sonic_fan = Owner.create(name: "Huge Sonic Fan")
meh_sonic_fan = Owner.create(name: "Meh Sonic Fan")
rush_b = Owner.create(name: "Rush B")

sonic_the_hedgehog = Game.create(name: "Sonic the Hedgehog", release_date: "06/23/1991", platform: "Sega Genesis")
counter_strike = Game.create(name: "Counter-Strike", release_date: "11/09/2000", platform: "PC")
streets_of_rage_2 = Game.create(name: "Streets of Rage 2", release_date: "12/20/1992", platform: 
"Sega Genesis")

action = Genre.create(name: "Action")
platformer = Genre.create(name: "Platformer")
fps = Genre.create(name: "First Person Shooter")
beat_em_up = Genre.create(name: "Beat em Up")

sonic_the_hedgehog.genres << action 
sonic_the_hedgehog.genres << platformer 
counter_strike.genres << fps
streets_of_rage_2.genres << action 
streets_of_rage_2.genres << beat_em_up

rush_b.games << counter_strike
huge_sonic_fan.games << sonic_the_hedgehog 
huge_sonic_fan.games << streets_of_rage_2 
meh_sonic_fan.games << sonic_the_hedgehog
meh_sonic_fan.games << counter_strike