//
//  main.swift
//  Structs v. Classes
//
//  Created by Connor Boyce on 9/9/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation

var hero = SuperheroClass(name: "Iron Man", universe: "Marvel")

var anotherHero = hero
anotherHero.name = "Hulk"
print(hero.name)
print(anotherHero.name)

var newHero = SuperheroStruct(name: "Iron Man", universe: "Marvel")
var anotherNewHero = newHero
anotherNewHero.name = "The Hulk"
print(newHero.name)
print(anotherNewHero.name)

