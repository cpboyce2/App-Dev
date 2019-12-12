//
//  ContentView.swift
//  BusinessCard
//
//  Created by Connor Boyce on 10/31/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import SwiftUI
// FlatUIColors.com
//GoogleFonts

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.52, blue: 0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("MyPhoto").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 10))
                Text("Connor Boyce")
                    .font(Font.custom("Jomolhari-Regular", size: 40))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Divider()
                InfoView(text: "+1 (980) 333 8340", imageName: "phone.fill", color: .green)
                InfoView(text: "cpboyce2@ncsu.edu", imageName: "envelope.fill", color: .green)



            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {

    let text: String
    let imageName: String
    let color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50, alignment: .center)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(color)
                Text(text).foregroundColor(.black)
            })
            .padding(.all)
    }
}
