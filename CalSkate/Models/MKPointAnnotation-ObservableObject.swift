//
//  MKPointAnnotation-ObservableObject.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/2/20.
//

import MapKit


extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {self.title ?? ""}
        set {title = newValue}
    }

    public var wrappedSubtitle: String {
        get {self.subtitle ?? ""}
        set {subtitle = newValue}
    }
    
    public var wrappedCoordinate: CLLocationCoordinate2D {
        get {self.coordinate}
    }
}
