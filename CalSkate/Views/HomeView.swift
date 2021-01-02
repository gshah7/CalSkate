//
//  HomeView.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/1/20.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State var center = CLLocationCoordinate2D()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var showingEditScreen = false
    @State private var selection = 1
    

    var body: some View {
        Group {
            TabView(selection:$selection){
                ListView(locations: $locations)
                .tabItem {
                    Image(systemName: "mappin.circle")
                    
                }.tag(0)
                 
                ZStack{
                    MapView(center: $center, selectedPlace: $selectedPlace, showingPlaceDetails: $showingEditScreen, annotations: locations).edgesIgnoringSafeArea(.all)
                    Circle()
                        .fill(Color.black)
                        .opacity(0.0)
                        .frame(width: 32, height: 32)
                        .overlay(Circle()
                                .stroke(Color.black, lineWidth: 5)
                                .opacity(0.65))
                    VStack{
                    HStack{
                        Spacer()
                        Button(action:{
                            let newLocation = CodableMKPointAnnotation()
                            newLocation.title = ""
                            newLocation.coordinate = self.center
                            self.locations.append(newLocation)
                            self.selectedPlace = newLocation
                            self.showingEditScreen = true
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(Color.black.opacity(0.65))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                        
                        }
                    Spacer()
                    }
                }
                .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
                    if self.selectedPlace != nil {
                        EditView(placemark: self.selectedPlace!)
                    }else{
                        IntroView()
                    }
                }
                .onAppear(perform: loadData)
                .tabItem {
                    Image(systemName: "map")
                    
                }.tag(1)
                    
                TrickView()
                .tabItem{
                    Image(systemName:"list.dash")
                    
                }.tag(2)
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")

        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

