//
//  Monster.swift
//  MonsterTown
//
//  Created by Connor Boyce on 9/22/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name : String
    var victimPool: Int {
        get {
            return town?.population ?? 0
        } set(newVictimPool){
            town?.population = newVictimPool
        }
    }

    init(newTown : Town?, townName: String, poolSize: Int) {
        town = newTown
        name = townName
        victimPool = poolSize
    }

    // Type Method
    class func makeNoise() -> String {
        return "Scary noise..."
    }

    // Instance method
    func terrorizeTown(){
        if town != nil {
            print("\(name) is terroizing the town")
        }
        else {
            print("\(name) hasn't found a town to terrorize yet")
        }
    }
}

class Zombie: Monster {

    var walksWithLimp: Bool = true

    final override func terrorizeTown() {
        super.terrorizeTown()
        if var terrorTown = town {
            terrorTown.changePopulation(by: -10)
        }

        if walksWithLimp{
            print("\(name) walks with a limp")
        }
    }
}
