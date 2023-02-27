//
//  ContentView.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 22.02.2023.
//

import SwiftUI

struct ChooseFlowerTypeScreen: View {
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    ZStack {
      Color(.systemGray)
        .ignoresSafeArea()
      
      VStack {
        // Title
        Text("Our flowers")
          .font(.largeTitle)
          .bold()
          .padding()
        ScrollView(showsIndicators: false) {
          ForEach(FlowerTypeName.allFlowerTypes) { flower in
            FlowerTypeSection(flowerType: flower) {
              coordinator.push(.flowersScreen(type: flower))
            }
              .padding(.bottom, 10)
          }
        }
      }
    }
  }
}

struct FlowerTypeSection: View {
  
  @State var flowerType: FlowerTypeName
  @State var selected: () -> Void
  
  var body: some View {
    
    VStack(spacing: 0) {
      Image(uiImage: flowerType.getImage())
        .resizable()
        .frame(width: 370, height: 370, alignment: .center)
      Text(flowerType.rawValue)
        .font(.system(size: 30))
        .italic()
        .foregroundColor(.black)
        .frame(width: 370, height: 60, alignment: .center)
        .background(Color.white)
    }
    .cornerRadius(30)
    .onTapGesture {
      selected()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFlowerTypeScreen()
    }
}
