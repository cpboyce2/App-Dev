//
//  DetailView.swift
//  HackerNews
//
//  Created by Connor Boyce on 11/3/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import SwiftUI


struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

