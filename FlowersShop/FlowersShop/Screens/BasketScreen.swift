//
//  BasketScreen.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 22.02.2023.
//

import SwiftUI
import UIKit

struct BasketScreen: View {
  @EnvironmentObject private var coordinator: Coordinator
  @State var flowersInBasket: [CompletedFlowerSelection] = [
    CompletedFlowerSelection(name: "Large bouquet of black callas", quantity: 19, image: UIImage(named: "Large bouquet of black callas")!, price: 100)
  ]
  @State var totalPrice: UInt = 0
  
  var body: some View {
    VStack {
      
      List {
        ForEach(flowersInBasket) { flower in
          HStack {
            Image(uiImage: flower.image)
              .resizable()
              .frame(width: 100, height: 100, alignment: .center)
              .cornerRadius(10)
            VStack {
              Text(flower.name)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .font(.title3)
              HStack {
                Text("\(flower.quantity) pieces")
                  .italic()
                  .fontWeight(.thin)
                Spacer()
                Text("\(flower.price) CHF")
                  .bold()
              }
              .padding(.horizontal)
            }
          }
        }
        .onDelete { indexSet in
          flowersInBasket.remove(atOffsets: indexSet)
          recountTotalPrice()
        }
      }
      .onAppear {
        recountTotalPrice()
      }
      
      HStack {
        Button {
        } label: {
          Text("Go to checkout")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .bold()
        }
        
        Spacer()
        Text("Total: \(totalPrice) CHF")
          .font(.title2)
          .bold()
      }
      .padding()
    }
    
  }
  
  private func recountTotalPrice() {
    var price: UInt = 0
    flowersInBasket.forEach { flower in
      price += flower.price
    }
    totalPrice = price
  }
}


struct BasketScreen_Previews: PreviewProvider {
  static var previews: some View {
    BasketScreen()
  }
}
