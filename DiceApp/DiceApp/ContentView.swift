//
//  ContentView.swift
//  DiceApp
//
//  Created by Connor Boyce on 10/31/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // This keyword allows the vuew to update whenever the value changes
    // We had to add this because struct properties are usually immutable
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    var body: some View {
        ZStack {
            Image("background").resizable().aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    diceView(n: leftDiceNumber)
                        .padding(.horizontal)
                    diceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .background(Color.red)
                        .padding(.horizontal)
                }
            }

        }

    }
}

struct diceView: View {

    let n: Int
    var body: some View {
        Image("dice\(n)").resizable().aspectRatio(1, contentMode: .fit)
            .frame(width: 150, height: 150, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


