//
//  TrickView.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/2/20.
//

import SwiftUI

struct TrickView: View {
    let basics = [Trick(name: "Ollie"), Trick(name: "Shuvit"), Trick(name: "Frontside 180"), Trick(name: "Backside 180"), Trick(name: "Kickflip"), Trick(name: "Heelflip"), Trick(name: "Tic-Tac"), Trick(name: "Powerslide")]
    let flips = [Trick(name: "360 Flip"), Trick(name: "Hardflip"), Trick(name: "Backside Flip"), Trick(name: "Bigspin"), Trick(name: "Casper Flip"), Trick(name: "Gazelle Flip"), Trick(name: "Hospital Flip"), Trick(name: "Nightmare Flip")]
    let grinds = [Trick(name: "50-50 Grind"), Trick(name: "5-0 Grind"), Trick(name: "Bluntside"), Trick(name: "Boardslide"), Trick(name: "Crooked Grind"), Trick(name: "Feeble Grind"), Trick(name: "Nosegrind"), Trick(name: "Darkslide")]
    let misc = [Trick(name: "Manual"), Trick(name: "Nose Manual"), Trick(name: "Acid Drop"), Trick(name: "Boneless"), Trick(name: "Hippie Jump"), Trick(name: "Milkshake"), Trick(name: "Pogo"), Trick(name: "Varial")]
    
    
    
    @State private var choice = "All"
    
    let width = UIScreen.main.bounds.size.width * 0.95
    
    var body: some View {
        NavigationView{
            VStack{
                Text(choice)
                    .font(.title2)
                    .padding()
                    .contextMenu{
                        Button(action: {self.choice = "All"}) {Text("All")}
                        Button(action: {self.choice = "Basics"}) {Text("Basics")}
                        Button(action: {self.choice = "Flips"}) {Text("Flips")}
                        Button(action: {self.choice = "Grinds"}) {Text("Grinds")}
                        Button(action: {self.choice = "Misc"}) {Text("Misc")}
                        
                    }
                
                ScrollView{
                    switch choice{
                    case "Basics":
                        ForEach(basics) { trick in
                            tricker(trick: trick)
                        }.frame(width: width)
                    case "Flips":
                        ForEach(flips) { trick in
                            tricker(trick: trick)
                        }.frame(width: width)
                    case "Grinds":
                        ForEach(grinds) { trick in
                            tricker(trick: trick)
                        }.frame(width: width)
                    case "Misc":
                        ForEach(misc) { trick in
                            tricker(trick: trick)
                        }.frame(width: width)
                    default:
                        ForEach(basics + flips + grinds + misc) { trick in
                            tricker(trick: trick)
                        }.frame(width: width)
                    }
                }
            }
        }
    }
}


struct tricker: View {
    var trick: Trick
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    @State var texter = "Start"
    @State var colr = Color.blue
    var body: some View {
        VStack{
            Divider()
            HStack{
                Text(trick.name)
                Spacer()
                Button(action:{
                    trick.begin = true
                    trick.SetStart()
                    self.texter = self.dateFormatter.string(from: trick.started)
                    self.colr = Color.black
                }) {
                    if(!trick.begin){
                        Text(self.texter).foregroundColor(colr)
                    }else{
                        Text(self.dateFormatter.string(from: trick.started)).foregroundColor(Color.blue)
                    }
                    
                }
            }
        }
    }
}
    
