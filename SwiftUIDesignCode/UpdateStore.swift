//
//  UpdateStore.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 12/28/20.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
