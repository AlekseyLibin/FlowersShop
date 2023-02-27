//
//  FlowerTypeName.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 22.02.2023.
//
import UIKit

enum FlowerTypeName: String, Identifiable {
  
  var id: Self {
    return self
  }
  
  case callas = "Callas"
  case carnations = "Carnations"
  case delphinium = "Delphinium"
  case eustoma = "Eustoma"
  case hydrangeas = "Hydrangeas"
  case matthiols = "Matthiols"
  case peonies = "Peonies"
  case tulips = "Tulips"
  
  static let allFlowerTypes: [FlowerTypeName] = [
    .callas, .carnations, .delphinium, .eustoma, .hydrangeas, .matthiols, .peonies, .tulips
  ]
  
  func getImage() -> UIImage {
    UIImage(named: self.rawValue) ?? UIImage()
    
    
  }
}
