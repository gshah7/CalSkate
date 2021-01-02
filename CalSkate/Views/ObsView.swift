//
//  ObsView.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/9/20.
//

import SwiftUI
import MapKit


struct ObsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    @Binding var location: [CodableMKPointAnnotation]
    @Binding var needRefresh: Bool
    var obstacles = ["Pipe", "Stairs", "Ramp", "Gap", "Rail", "Ledge", "Bowl", "Flatground"]
    @State private var obs = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Picker(selection: $obs, label: Text("Obstacle Type")){
                        ForEach(0 ..< obstacles.count) {
                            Text(self.obstacles[$0]).tag(self.obstacles[$0])
                        }
                    }
                    TextField("Description", text: $placemark.wrappedSubtitle)
                }
                Button(action: {
                    placemark.wrappedTitle = obs
                    self.needRefresh.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                        }) {
                    Text("Save changes")
                }
            }
        }.onAppear(perform: setTitle)
    }
    func setTitle(){
        obs = placemark.wrappedTitle
    }
}
