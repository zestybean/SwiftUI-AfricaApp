//
//  ContentView.swift
//  Shared
//
//  Created by Brando Lugo on 5/31/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    //BASIC LAYOUT
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    //ADV LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 2
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid num: \(gridColumn)")
        //TOOLBAR IMAGE
        switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
        }
    }

    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal)
                                })//:LINK
                        }//:LOOP
                    }//:LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 20, content: {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })//:LINK
                            }//:LOOP
                        })//:VGRID
                        .padding(10)
                        .animation(.easeIn)
                    }//:SCROLL
                }//:CONDITION
            }//:GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    HStack(spacing: 10){
                        //LIST
                        Button(action: {
                            print("List view is active")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })//:LISTBUTTON
                        
                        //GRID
                        Button(action: {
                            print("Grid view is active")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    }
                    
                })
            })//:TOOL
        } //:NAVIGATION
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
