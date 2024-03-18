//
//  ContentView.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 06/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("Log_Status") var Log_Status : Bool = false
    var body: some View {
        
        Group{
            if Log_Status {
                TabBarView()
            }else{
                AuthView()
            }
        }
    }
}

#Preview {
    ContentView()
}
