//
//  IntroView.swift
//  CalSkate
//
//  Created by Gaurav Shah on 12/9/20.
//

import SwiftUI

struct IntroView: View {
    @Environment(\.presentationMode) var presentationMode
    var width = UIScreen.main.bounds.size.width * 0.85
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Welcome to CalSkate!")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 60)
                
                Image("calskate")
                    .resizable()
                    .frame(height: 105)
                    .padding(.bottom, 60)

                HStack{
                    VStack{
                        HStack{
                            Text("Places").bold()
                            Image(systemName: "mappin.circle")
                        }
                        Spacer().frame(height: 30)
                        Text("• Keep track of obstacle locations").font(.caption).padding(.top)
                        Text("• Sort places by obstacle type").font(.caption).padding(.top)
                        Text("• Manage and edit obstacles").font(.caption).padding(.top)
                        
                    }.frame(width: width/3)
                    
                    Divider()
                    
                    VStack{
                        HStack{
                            Text("Map").bold()
                            Image(systemName: "map")
                        }
                        Spacer().frame(height: 30)
                        Text("• Mark obstacle locations on map").font(.caption).padding(.top)
                        Text("• Write place descriptions").font(.caption).padding(.top)
                        Text("• Manage and delete pins").font(.caption).padding(.top)
                        
                    }.frame(width: width/3)
                    
                    Divider()
                    
                    VStack{
                        HStack{
                            Text("Tricks").bold()
                            Image(systemName: "list.dash")
                        }
                        Spacer().frame(height: 30)
                        Text("• Scroll through skate tricks").font(.caption).padding(.top)
                        Text("• Checkoff completed tricks").font(.caption).padding(.top)
                        Text("• Sort through tricks by category").font(.caption).padding(.top)
                        
                    }.frame(width: width/3)
                }.frame(height: 250, alignment: .bottom)
                
                Button(
                    action: {self.presentationMode.wrappedValue.dismiss()},
                    label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding()
                })
                    .frame(width: width/2.5)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(.top)
            
            }
        }
    }
}

