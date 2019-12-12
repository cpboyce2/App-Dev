//
//  main.swift
//  MonsterTown
//
//  Created by Connor Boyce on 9/20/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation


var myTown = Town()
//myTown.numberOfPeople = 100000
//print(myTown.townSize)
myTown.changePopulation(by: 10000)
myTown.printDescription()
var newMonster = Monster(newTown: myTown, townName: "Charlotte", poolSize: 100)
print(newMonster.victimPool)

//myTown.numberOfPeople = 5555
////myTown.printDescription()
////print(myTown.numberOfPeople)
//var myMonster = Monster()
//myMonster.town = myTown
//myMonster.name = "Dexter"
//myMonster.terrorizeTown()
//var myZombie = Zombie()
//myZombie.town = myTown
//myZombie.name = "Tommy"
//myZombie.terrorizeTown()
//print(Monster.makeNoise())

