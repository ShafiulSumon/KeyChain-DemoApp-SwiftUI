//
//  ContentView.swift
//  KeyChain
//
//  Created by ShafiulAlam-00058 on 4/12/23.
//

import SwiftUI
import Security

struct ContentView: View {
    
    @State var status: String = ""
    
    var body: some View {
        NavigationView {
            HStack {
                
                NavigationLink("Set user data!") {
                    SetDataView()
                }
                .frame(width: 150, height: 50)
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Spacer().frame(width: 20)
                
                NavigationLink("Get user Data") {
                    GetDataView()
                }
                .frame(width: 150, height: 50)
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .navigationTitle("KeyChain")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
