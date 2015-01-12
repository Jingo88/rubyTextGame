require 'pry'
# random weapon attack damage
# run or fight
# experience points and levels
# hp points and levels


hero = {
	'atkSpd' => 8,
	'level' => 1,
	'health' => 10,
}

enemy = {}

monsters = ['Mutated Octopus', 'Sabertooth Goldfish', 'Lady Gaga', 'Hannah Montana']
monsterAtk = ['Slap', 'Bite', 'Eyepoke']
monsterDmg = ''

# bring the values into monsterfight. 
def monsterfight(user, monster, mAtk, enemy)

#make a loop with a boolean value. The loop will keep running unless somebody's health goes to zero or 
#the user runs away

	enemy['name'] = monster.sample
	combat = true

	if enemy['name'] == 'Mutated Octopus'
		enemy['hp'] = 7
		enemy['atkSpd'] = 6
		enemy['armor'] = 1

	elsif enemy['name'] == 'Sabertooth Goldfish'
		enemy['hp'] = 6
		enemy['atkSpd'] = 5
		enemy['armor'] = 1

	elsif enemy ['name'] == 'Lady Gaga'
		enemy['hp'] = 8
		enemy['atkSpd'] = 8
		enemy['armor'] = 1

	elsif enemy ['name'] == 'Hannah Montana'
		enemy['hp'] = 10
		enemy['atkSpd'] = 10
		enemy['armor'] = 1
	end

	puts ''

# choosing the random attack of the monster. no need to push into a hash
	def monsterAttack(user, mAtk, enemy)
		randAttack = mAtk.sample

		if randAttack == 'Slap'
			monsterDmg = 1
			user['health'] -= 1

		elsif randAttack == 'Bite'
			monsterDmg = 2
			user['health'] -= 1

		elsif randAttack == 'Eyepoke'
			monsterDmg = 3
			user['health'] -= 1
		end

		puts "You get hit by #{enemy['name']} for #{monsterDmg}. Your health is now #{user['health']}"
		
	end

	def heroAttack(user, enemy)

		heroAttack = user['weapon']

		if heroAttack == 'Sword'
			hitDmg = rand(2...5)
			enemy['hp'] -= hitDmg

		elsif heroAttack == 'Spear'
			hitDmg = rand(1...6)
			enemy['hp'] -= hitDmg

		elsif heroAttack == 'Axe'
			hitDmg = rand(3...4)
			enemy['hp'] -= hitDmg
		end
		
		puts "You hit the #{enemy['name']} for #{hitDmg}. Their health is now #{enemy['hp']}"
	end

	puts "A wild #{enemy['name']} has appeared. Do you choose to fight or run? (enter 'fight' or 'run')"

	choice = gets.chomp.downcase

	while (user['health'] > 0 && enemy['hp'] > 0 && combat == true)

		if choice == 'fight'
			puts 'Alright lets do this!'
			monsterAttack(user, mAtk, enemy)
			heroAttack(user, enemy)

		elsif choice == 'run'
			puts 'You attempt to escape'

		elsif choice != 'fight' || choice != 'run' 
			puts 'Please enter "fight" or "run"'
			choice = gets.chomp.downcase
		end

		if enemy['hp'] > 0 && user['health']
			puts "Continue fighting? (fight or run)"
			choice = gets.chomp.downcase

		elsif enemy['hp'] <= 0
			puts "You have killed #{enemy['name']}"
			combat == false

		elsif user['health'] <= 0
			puts "You have died"
			combat == false
		end
	end

end









puts "Welcome Adventurer, state your name if intend to join this quest"

hero["name"] = gets.chomp.capitalize

puts "Hello #{hero["name"]} let us slay! Choose your weapon, I have a sword, or spear, or axe"

hero["weapon"] = gets.chomp.capitalize

if hero['weapon'] == 'Sword'
	hero['atkrange'] = '2 to 5'

elsif hero['weapon'] == 'Spear'
	hero['atkrange'] = '1 to 6'

elsif hero['weapon'] == 'Axe'
	hero['atkrange'] = '3 to 4'

else
	puts "I do not have that in my inventory, please choose a sword, or spear, or axe"

end

puts "Your weapon of choice is the #{hero['weapon']} your attack damage range is #{hero['atkrange']}"
puts "Your current health is #{hero['health']}"

puts ""

puts "Alright #{hero['name']} you are now prepared to venture the wilderness with me, let us depart"

# calls the method while bringing in our arrays and hashes
monsterfight(hero,monsters,monsterAtk, enemy)





















