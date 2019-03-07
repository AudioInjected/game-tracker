huge_sonic_fan = Owner.create(name: "Huge Sonic Fan")
meh_sonic_fan = Owner.create(name: "Meh Sonic Fan")

sonic_the_hedgehog = Game.create(name: "Sonic the Hedgehog")
action = Genre.create(name: "Action")
platformer = Genre.create(name: "Platformer")

sonic_the_hedgehog.genres << action 
sonic_the_hedgehog.genres << platformer 
sonic_the_hedgehog.save

huge_sonic_fan.games << sonic_the_hedgehog 
meh_sonic_fan.games << sonic_the_hedgehog