//
//  DataStore.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/5/21.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts(){
        API().getPost { (posts) in
            self.posts = posts
        }
    }
}
