//
//  Coordinator.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 24.02.2023.
//

import SwiftUI

enum Page: Identifiable, Hashable {
  var  id: String {
    return UUID().uuidString
  }
  
  case flowerTypesScreen
  case flowersScreen(type: FlowerTypeName)
  case basketScreen
}

enum Sheet: Identifiable {
  var id: String {
    return UUID().uuidString
  }
  
  case flowerDetailScreen(flower: FlowerToChooseEntity)
}

class Coordinator: ObservableObject {
  
  @Published var path = NavigationPath()
  @Published var sheet: Sheet?
  
  func push(_ page: Page) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
  
  func present(sheet: Sheet) {
    self.sheet = sheet
  }
  
  func dismiss(sheet: Sheet) {
    self.sheet = nil
  }
  
  @ViewBuilder
  func build(page: Page) -> some View {
    switch page {
    case .flowerTypesScreen:
      ChooseFlowerTypeScreen()
    case .flowersScreen(let type):
      FlowersScreen(type: type)
    case .basketScreen:
      BasketScreen()
    }
  }
  
  @ViewBuilder
  func build(sheet: Sheet) -> some View {
    switch sheet {
    case .flowerDetailScreen(let flower):
      FlowerDetailScreen(flower: flower)
    }
  }
  
}


