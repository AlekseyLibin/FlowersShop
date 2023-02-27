//
//  FlowerDetailScreen.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 23.02.2023.
//

import SwiftUI

struct FlowerDetailScreen: View {
  @State var flower: FlowerToChooseEntity
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    ZStack {
      Color(.lightGray).ignoresSafeArea()
      VStack {
        flower.image
          .resizable()
          .frame(width: 300, height: 300, alignment: .center)
          .cornerRadius(10)
          .padding()
        
        Text(flower.name)
          .multilineTextAlignment(.center)
          .italic(true)
          .bold()
          .padding()
        
        ForEach(flower.options) { option in
          Button {
            flower.selection = option
          } label: {
            HStack {
              if flower.selection == option {
                Image(systemName: "circlebadge.fill")
                  .imageScale(.large)
              } else {
                Image(systemName: "circlebadge")
                  .imageScale(.large)
              }
              Text("\(option.amount) pieces")
              Spacer()
            }
            .foregroundColor(.black)
            .padding()
          }
          .buttonStyle(.plain)
        }
        
        HStack {
          Text("Price: \(flower.selection?.price ?? 0) CHF")
            .bold()
            .font(.title3)
          Button {
            guard let selection = flower.selection else { return }
            let flowerToBuy = CompletedFlowerSelection(
            name: flower.name,
             quantity: selection.amount,
            image: UIImage(named: flower.name)!, price: selection.price)
            
          } label: {
            Text("Add to basket")
              .foregroundColor(.black)
              .padding(.all, 10)
              .background(Color.white)
              .cornerRadius(10)
              .font(.title3)
              .padding()
          }
        }
        .padding()
      }
    }
  }
}

struct FlowerDetailScreen_Previews: PreviewProvider {
  static var previews: some View {
    let flower = FlowerToChooseEntity(name: "Callas", options: [
      .init(amount: 19, price: 100),
      .init(amount: 29, price: 250),
      .init(amount: 39, price: 300)
    ])
    FlowerDetailScreen(flower: flower)
  }
}
