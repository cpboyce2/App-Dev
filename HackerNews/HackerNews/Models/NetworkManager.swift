//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Connor Boyce on 11/3/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation
// With the observable I am saying that other classes and strcutures can see my data

class NetworkManager: ObservableObject {
    // Published is saying that whenever there is changes to this property you should notify all of those classes that are listening
    @Published var posts = [Post]()
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let cleanData = data{
                        do{
                            let results = try decoder.decode(HackerData.self, from: cleanData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }

                        } catch{
                            print(error)
                        }

                    }

                }

            }
            task.resume()
        }
    }
}
