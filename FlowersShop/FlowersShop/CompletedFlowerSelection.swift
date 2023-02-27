//
//  CompletedFlowerSelection.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 23.02.2023.
//

import UIKit

struct CompletedFlowerSelection: Identifiable {
  var id: String {
    return UUID().uuidString
  }
  let name: String
  let quantity: UInt
  let image: UIImage
  let price: UInt
}
