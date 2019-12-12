//
//  ContentView.swift
//  HackerNews
//
//  Created by Connor Boyce on 11/3/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts, rowContent: { (post) in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)

                    }
                }

            })
        .navigationBarTitle("HackerNews")

        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
