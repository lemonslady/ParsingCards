//
//  StartAdd.swift
//  ParsingCards
//
//  Created by Giulia Casucci on 27/11/22.
//

import SwiftUI
import NaturalLanguage
import CoreML


struct StartAdd: View {
    
    @Binding var searchText: String
    
    @State var name: String = ""
    @State var number: String = ""
    @State var email: String = ""
    
    
    
    //The function does the parsing of Names, Numbers, Emails
    func parsing(){
        name = ""
        number = ""
        email = ""
        
        var nameArray : [String] = []
        
        let text = searchText
        
        //preparing the use of ParsingCardsTagger
        do {
            let mlModel = try ParsingCardsTagger(configuration: MLModelConfiguration()).model
            
            let customModel = try NLModel(mlModel: mlModel)
            let customTagScheme = NLTagScheme("Email")
            
            let tagger = NLTagger(tagSchemes: [.nameTypeOrLexicalClass, customTagScheme])
            tagger.string = text
            tagger.setModels([customModel], forTagScheme: customTagScheme)
            
            tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word,
                                 scheme: customTagScheme, options: .omitWhitespace) { tag, tokenRange  in
                if let tag = tag {
                    print("\(text[tokenRange]): \(tag.rawValue)")
                    
                    //switch case based on labels of the model
                    switch tag.rawValue {
                    case "name":
                        //Putting name inside an array to create a string composed by name + whitespace + surname
                        nameArray.append(String(text[tokenRange]))
                        print (nameArray)
                        
                    case "number":
                        number.append(contentsOf: text[tokenRange])
                        
                    case "email":
                        email.append(contentsOf: text[tokenRange])
                        
                    default:
                        print("")
                    }
                }
                return true
            }
        } catch {
            print(error)
        }
        
        //name + surname append
        for elements in nameArray{
            name.append(elements + " ")
        }
    }
    
    
    
    let screenWidth = UIScreen.main.bounds.width
    
    //actual view of parsing
    var body: some View {
        VStack{
            List {
                if !name.isEmpty {
                    
                    CustomRow(title: name, subtitle: "name")
                    
                }
                
                if !number.isEmpty {
                    
                    CustomRow(title: number, subtitle: "number")
                    
                }
                
                if !email.isEmpty {
                    
                    CustomRow(title: email, subtitle: "email")
                    
                }
                
                //The button is enabled after adding name + number
                if !name.isEmpty && !number.isEmpty{
                    Button ("Add Contact") {
                        //action
                    }.frame(width: screenWidth-32, alignment: .center)
                }
            }.scrollContentBackground(.hidden)
        }
        .onChange(of: searchText, perform: {_ in
            parsing()
        })
    }
}


//This struct is used to build the row inside the list
private struct CustomRow : View{
    var title : String
    var subtitle : String
    
    var body : some View {
        VStack(alignment: .leading){
            Text(subtitle)
                .font(.subheadline)
            Text(title)
                .font(.headline)
        }
    }
}



