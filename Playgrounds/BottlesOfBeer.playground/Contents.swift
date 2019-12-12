import Cocoa

func beerSong(startingNumber : Int){
    
    for number in 1...startingNumber{
        print("\(startingNumber-(number-1)) bottles of beer on the wall, \(startingNumber-(number-1)) bottles of beer, Take one down, pass it around \(startingNumber-number) bottles of beer on the wall")
    }

}

beerSong(startingNumber: 100)
