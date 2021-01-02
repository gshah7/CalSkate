//
//  ListView.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/2/20.
//

import SwiftUI
import MapKit

struct ListView: View {
    @Binding var locations: [CodableMKPointAnnotation]
    @State var needRefresh: Bool = false
    @State var sorted: Bool = false
    @State var whichsort: String = "All"
    
    var body: some View {
        
        NavigationView {
                List(locations, id: \.self) { annot in
                    NavigationLink(destination: ObsView(placemark: annot, location: $locations, needRefresh: self.$needRefresh)) {
                        HStack {
                            Text(annot.wrappedTitle).bold()
                            Text("-")
                            Text(annot.wrappedSubtitle)
                            Spacer()
                        }.accentColor(self.needRefresh ? .white : .black)
                    }
                }
            .navigationTitle("Obstacles")
        }
    }
}

