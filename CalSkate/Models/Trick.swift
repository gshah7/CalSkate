//
//  Trick.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/9/20.
//

import Foundation
import SwiftUI

class Trick: Identifiable {
    var id = UUID()
    var name: String
    var started: Date
    var completed: Date
    var begin = false
    
    init(name: String) {
        self.name = name
        self.started = Date()
        self.completed = Date()
    }
    
    func SetStart(){
        self.started = Date()
    }
    func SetEnd(){
        self.completed = Date()
    }
}

