//
//  PostList.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/5/21.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            Text(post.title)
                
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
