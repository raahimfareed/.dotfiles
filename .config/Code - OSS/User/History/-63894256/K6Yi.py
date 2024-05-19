import random
import sys

class Player:
    def __init__(self):
        self.health = 100
        self.coins = 0
        self.weapons = {"pistol": 25, "shotgun": 40, "rifle": 60}
        self.current_weapon = "pistol"
    
    def attack(self):
        return self.weapons[self.current_weapon]
    
    def take_damage(self, damage):
        self.health -= damage
        if self.health < 0:
            self.health = 0
    
    def is_alive(self):
        return self.health > 0

class Zombie:
    def __init__(self, health, attack):
        self.health = health
        self.attack = attack
    
    def take_damage(self, damage):
        self.health -= damage
        if self.health < 0:
            self.health = 0
    
    def is_alive(self):
        return self.health > 0

def fight(player, zombie):
    while player.is_alive() and zombie.is_alive():
        print("\nPlayer Health:", player.health)
        print("Zombie Health:", zombie.health)
        print("\n1. Attack")
        print("2. Run")
        choice = input("Enter your choice: ")
        if choice == "1":
            zombie.take_damage(player.attack())
            print("You attacked the zombie!")
            if zombie.is_alive():
                player.take_damage(zombie.attack)
                print("Zombie attacked you!")
        elif choice == "2":
            print("You ran away!")
            sys.exit(0)  # Player ran away
    if player.is_alive():
        return True  # Player defeated the zombie
    else:
        return False  # Player was defeated by the zombie

def main():
    player = Player()
    wave = 1
    while True:
        print("\nWave", wave)
        zombies_to_defeat = 5 + wave * 2
        for i in range(zombies_to_defeat):
            zombie = Zombie(random.randint(50, 80), random.randint(10, 20))
            print("\nZombie", i+1)
            if fight(player, zombie):
                player.coins += random.randint(1, 10)
                print("You defeated the zombie! You got some coins:", player.coins)
            else:
                print("Game over! You were defeated by the zombie.")
                sys.exit(0)
        if wave % 10 == 0:
            print("\nBoss Fight!")
            boss = Zombie(150, 30)
            if fight(player, boss):
                player.coins += random.randint(20, 50)
                print("You defeated the boss! You got some coins:", player.coins)
            else:
                print("Game over! You were defeated by the boss.")
                sys.exit(0)
        wave += 1

if __name__ == "__main__":
    main()
