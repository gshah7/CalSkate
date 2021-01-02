//
//  EditView.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/2/20.
//

import SwiftUI
import MapKit

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    
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
                }
                
                Section {
                    TextField("Description", text: $placemark.wrappedSubtitle)
                }
                
                
            .navigationBarTitle("Edit Obstacle")
            .navigationBarItems(trailing: Button("Done") {
                placemark.wrappedTitle = obs
                self.presentationMode.wrappedValue.dismiss()
            })
            }
        }.onAppear(perform: setTitle)
    }
    
    func setTitle(){
        obs = placemark.wrappedTitle
    }
    
}
