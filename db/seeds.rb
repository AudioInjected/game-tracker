huge_sonic_fan = Owner.create(name: "Huge Sonic Fan")
meh_sonic_fan = Owner.create(name: "Meh Sonic Fan")
rush_b = Owner.create(name: "Rush B")

sonic_the_hedgehog = Game.create(name: "Sonic the Hedgehog", release_date: "06/23/1991", platform: "Sega Genesis")
counter_strike = Game.create(name: "Counter Strike", release_date: "11/09/2000", platform: "PC")

action = Genre.create(name: "Action")
platformer = Genre.create(name: "Platformer")
fps = Genre.create(name: "First Person Shooter")

sonic_the_hedgehog.genres << action 
sonic_the_hedgehog.genres << platformer 
counter_strike.genres << fps

rush_b.games << counter_strike
huge_sonic_fan.games << sonic_the_hedgehog 
meh_sonic_fan.games << sonic_the_hedgehog