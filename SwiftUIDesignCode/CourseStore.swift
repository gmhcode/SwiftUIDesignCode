//
//  CourseStore.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/5/21.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "0ge8xzmnbp2c", accessToken: "03010b0d79abcb655ca3fda453f2f493b5472e0aaa53664bc7dea5ef4fce2676")

func getArray(id: String, completion: @escaping ([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print("Error \(error)!")
        }
        print(result)
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init(){
        getArray(id: "course") { (items) in
            items.forEach { (item) in
//                print( as! String)
                self.courses.append(Course(
                                        title: item.fields["title"] as! String,
                                        subtitle: item.fields["subtitle"] as! String,
                                        image: #imageLiteral(resourceName: "Background1"),
                                        logo: #imageLiteral(resourceName: "Logo1"),
                                        color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
                                        show: false))
            }
        }
    }
}
