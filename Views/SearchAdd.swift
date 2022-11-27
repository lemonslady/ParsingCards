//
//  SearchAdd.swift
//  ParsingCards
//
//  Created by Giulia Casucci on 27/11/22.
//

import SwiftUI

struct SearchAdd: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    
    var body: some View {
        
        VStack{
           
            ZStack {
                Rectangle()
                    .foregroundColor(Color("AccentColor"))
                
                HStack {
                    TextField("Search, interact, add...", text: $searchText) {
                        startedEditing in
                        if startedEditing {
                            withAnimation {
                                searching = true
                            }
                        }
                    } onCommit: {
                        withAnimation {
                            searching = false
                        }
                    }
                    if searching {
                        Button{
                            searchText = ""
                            withAnimation {
                                searching = false
                                UIApplication.shared.dismissKeyboard()
                            }
                        } label: {
                            Label("", systemImage: "x.circle.fill")
                        }
                    }
                }
                .padding(.leading, 13)
            }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
            
            
            
        }
    }
}



extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

