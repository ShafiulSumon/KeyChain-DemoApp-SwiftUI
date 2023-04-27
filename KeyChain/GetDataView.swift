//
//  GetDataView.swift
//  KeyChain
//
//  Created by ShafiulAlam-00058 on 4/12/23.
//

import SwiftUI
import Security

struct GetDataView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Get your password here")
                .font(.title2)
            Spacer().frame(height: 30)
            TextField("UserName", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
            Text(password)
                .font(.title)
            
            if(password == "") {
                Button {
                    self.getData()
                } label: {
                    Text("Show")
                }
                .font(.title3)
                .frame(width: 100, height: 40)
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
        }
    }
    
    func getData() {
        let query = [
            kSecClass           : kSecClassInternetPassword,
            kSecAttrServer      : "local",
            kSecAttrAccount     : username,
            kSecReturnData      : true
        ] as CFDictionary
        
        var ref: AnyObject?
        SecItemCopyMatching(query, &ref)
        
        guard let ref = ref as? Data else {
            password = "Not ref Found"
            return
        }
        self.password = String(data: ref, encoding: .utf8) ?? "Not Found"
    }
}

struct GetDataView_Previews: PreviewProvider {
    static var previews: some View {
        GetDataView()
    }
}
