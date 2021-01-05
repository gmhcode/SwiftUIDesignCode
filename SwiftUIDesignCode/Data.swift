//
//  Data.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/5/21.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class API {
    func getPost(completion: @escaping ([Post]) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

            let posts = try! JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
            
            print(posts)
        }.resume()
    }
}
