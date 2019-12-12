//
//  Town.swift
//  MonsterTown
//
//  Created by Connor Boyce on 9/20/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation

struct Town{
    let region = "South"
    var population = 5422 {
        willSet(newPopulation){
            print("The population will change from \(population) to \(newPopulation)")
        }
        didSet(oldPopulation){
            print("The population has changed from \(oldPopulation) to \(population)")
        }
    }
    var numberOfStoplights = 4
    enum size {
        case small
        case medium
        case large
    }
    var townSize: size {
        get {
        switch self.population{
        case 0...10000:
            return size.small
        case 10001...100000:
            return size.medium
        default:
            return size.large
            }
        }
    }
    var numberOfPeople: Int {
        get {
            return population
        }
        set(newPop){
            population = newPop
            
        }
    }


    func printDescription(){
        print("Population: \(population); number of lights: \(numberOfStoplights);")
    }
    mutating func changePopulation(by amount: Int){
        population += amount
        
    }
}


