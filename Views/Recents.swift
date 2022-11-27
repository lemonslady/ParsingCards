//
//  Recents.swift
//  ParsingCards
//
//  Created by Giulia Casucci on 27/11/22.
//

import SwiftUI

struct Recents: View {
    
    var body: some View {
        NavigationStack {
            List{
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        //action
                    } label: {
                        Label("Setting", systemImage: "gear")
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Recents")
            
        }
        
    }
}


