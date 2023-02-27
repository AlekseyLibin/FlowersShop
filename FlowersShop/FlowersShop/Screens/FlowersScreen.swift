//
//  FlowersScreen.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 23.02.2023.
//

import SwiftUI

struct FlowersScreen: View {
  
  let items = [
    FlowerToChooseEntity(name: "Bridal bouquet of white callas", options: [
      .init(amount: 19, price: 100), .init(amount: 29, price: 150),
      .init(amount: 39, price: 200), .init(amount: 49, price: 250)
    ]),
    FlowerToChooseEntity(name: "Bride's bouquet of black and burgundy callas", options: [
      .init(amount: 19, price: 110), .init(amount: 29, price: 150),
      .init(amount: 39, price: 200), .init(amount: 49, price: 250)
    ]),
    FlowerToChooseEntity(name: "Bride's bouquet of peach callas", options: [
      .init(amount: 19, price: 120), .init(amount: 29, price: 150),
      .init(amount: 39, price: 200), .init(amount: 49, price: 250)
    ]),
    FlowerToChooseEntity(name: "Large bouquet of black and white callas", options: [
      .init(amount: 19, price: 130), .init(amount: 29, price: 150),
      .init(amount: 39, price: 200), .init(amount: 49, price: 250)
    ]),
    FlowerToChooseEntity(name: "Large bouquet of black callas", options: [
      .init(amount: 19, price: 140), .init(amount: 29, price: 150),
      .init(amount: 39, price: 200), .init(amount: 49, price: 250)
    ]),
    FlowerToChooseEntity(name: "Large bouquet of peach callas", options: [
      .init(amount: 19, price: 150), .init(amount: 29, price: 150),
      .init(amount: 39, price: 200), .init(amount: 49, price: 250)
    ])
  ]
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  @EnvironmentObject private var coordinator: Coordinator
  @State var type: FlowerTypeName
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(items, id: \.self.name) { flower in
          FlowerGrid(flower: flower)
            .onTapGesture {
              coordinator.present(sheet: .flowerDetailScreen(flower: flower))
            }
        }
      }
      .padding()
    }
    .background(Color.gray)
  }
}

struct FlowerGrid: View {
  @State var flower: FlowerToChooseEntity
  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        flower.image
          .resizable()
          .frame(width: 160, height: 160)
        VStack {
          Spacer()
          HStack {
            Spacer()
            Text("From CHF \(flower.options.first?.price ?? 0)")
              .italic()
              .font(.system(size: 11, weight: .light))
              .frame(width: 80, height: 20)
              .background(Color.green)
              .cornerRadius(8)
          }
        }
      }
      Text(flower.name)
        .lineLimit(2)
        .frame(width: 155,alignment: .leading)
        .padding(.all, 5)
        .font(.system(size: 12))
        .background(Color.white)
    }
    .background(Color.gray)
    .frame(width: 160, height: 200)
    .cornerRadius(10)
  }
}


struct FlowersScreen_Previews: PreviewProvider {
    static var previews: some View {
      FlowersScreen(type: .callas)
    }
}
