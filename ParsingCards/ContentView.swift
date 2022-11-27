//
//  ContentView.swift
//  ParsingCards
//
//  Created by Giulia Casucci on 27/11/22.
//

import SwiftUI

struct ContentView: View {
    
    //TabBar Variable
    @State var selection = 0
    
    //Variables for TextField
    @State var searchText = ""
    @State var searching = false
    
    
    var body: some View {
        
        TabView(selection: $selection){
            
            //FAVORITES VIEW
            VStack{
                if searching { StartAdd(searchText: $searchText) }
                else { Favorites() }
                
                SearchAdd(searchText: $searchText, searching: $searching)
            }
            .tabItem
            {
                if selection == 0 {
                    Label("Favorites", systemImage: "star")
                    .environment(\.symbolVariants, .fill) }
                else {
                    Label("Favorites", systemImage: "star")
                    .environment(\.symbolVariants, .none) }
                
            }.tag(0)
            
            
            //RECENTS VIEW
            VStack{
                if searching { StartAdd(searchText: $searchText) }
                else { Recents() }
                SearchAdd(searchText: $searchText, searching: $searching)
            }
            .tabItem
            {
                if selection == 1{
                    Label("Recents", systemImage: "clock")
                    .environment(\.symbolVariants, .fill) }
                else {
                    Label("Recents", systemImage: "clock")
                    .environment(\.symbolVariants, .none) }
            }.tag(1)
            
            
            //CONTACTS VIEW
            VStack{
                if searching { StartAdd(searchText: $searchText)}
                else { Contacts() }
                SearchAdd(searchText: $searchText, searching: $searching)
            }
            .tabItem {
                if selection == 2{
                    Label("Contacts", systemImage: "person.crop.circle")
                    .environment(\.symbolVariants, .fill) }
                else {
                    Label("Contacts", systemImage: "person.crop.circle")
                    .environment(\.symbolVariants, .none) }
            }.tag(2)
            
            
            //BIRTHDAYS VIEW
            VStack{
                if searching { StartAdd(searchText: $searchText) }
                else { Birthdays() }
                SearchAdd(searchText: $searchText, searching: $searching)
            }
            .tabItem {
                if selection == 3{
                    Label("Birthdays", systemImage: "gift").environment(\.symbolVariants, .fill) }
                else {
                    Label("Birthdays", systemImage: "gift").environment(\.symbolVariants, .none) }
            }.tag(3)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
