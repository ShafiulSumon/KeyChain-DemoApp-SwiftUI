//
//  SetDataView.swift
//  KeyChain
//
//  Created by ShafiulAlam-00058 on 4/12/23.
//

import SwiftUI
import Security

struct SetDataView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("UserName", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
            Spacer().frame(height: 30)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
            Spacer().frame(height: 30)
            Button {
                self.setData()
            } label: {
                Text("Save")
                    .font(.title2)
                    .frame(width: 100, height: 40)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
    
    func setData() {
        let keychainItem = [
            kSecValueData       : password.data(using: .utf8)!,
            kSecAttrAccount     : username,
            kSecAttrServer      : "local",
            kSecClass           : kSecClassInternetPassword
        ] as CFDictionary
        
        SecItemAdd(keychainItem, nil)        
    }
}

struct SetDataView_Previews: PreviewProvider {
    static var previews: some View {
        SetDataView()
    }
}
