//
//  FlowerEntity.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 23.02.2023.
//

import UIKit
import SwiftUI

struct FlowerToChooseEntity {
  
  init(name: String, options: [Option]) {
    self.name = name
    self.minimalPrice = options.first?.price
    self.image = Image(name)
    self.options = options
    self.selection = options.first
    print("\(selection?.amount ?? 0), \(selection?.price ?? 0)")
  }
  
  let name: String
  let minimalPrice: UInt?
  let image: Image
  let options: [Option]
  var selection: Option?
}


struct Option: Identifiable, Hashable {
  var id: String = UUID().uuidString
  let amount: UInt
  let price: UInt
}

