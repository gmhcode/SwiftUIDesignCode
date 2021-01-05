//
//  PostList.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/5/21.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var store = DataStore()
    @State var posts: [Post] = []
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading, spacing: 8.0) {
                Text(post.title).font(.system(.title, design: .serif)).bold()
                Text(post.body).font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            }
        .onAppear {
            API().getPost { (posts) in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
