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
        let colors = [#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
        getArray(id: "course") { (items) in
            items.forEach { (item) in
//                print( as! String)
                self.courses.append(Course(
                                        title: item.fields["title"] as! String,
                                        subtitle: item.fields["subtitle"] as! String,
                                        image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                                        logo: #imageLiteral(resourceName: "Logo1"),
                                        color: colors.randomElement()!,
                                        show: false))
            }
        }
    }
}
