//
//  ContentView.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive: Bool = false
    var body: some View {
        
        NavigationView {
        ZStack{
            Image("bg")
                .resizable()
                //.aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
//            //BUAT KALO ADA GRADIENT NYA
//            LinearGradient(colors: [.orange.opacity(0.7), .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
            
            
            VStack{
                NavigationLink(destination: InstrumentPage(), isActive: self.$isActive) {
                    Text("")
                }
                
                Button ("NEXT") {
                    self.isActive = true
                    }
                }
                .foregroundColor(.white)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                
                    .frame(width: 200, height: 100, alignment: .center)
                        .background(.blue.opacity(0.7))
                        .cornerRadius(70)
                        .padding(0)
                        .offset(x: 0, y: 300)
            }
            } .navigationViewStyle(.stack)
            
            

        }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

