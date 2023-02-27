//
//  CoordinatorView.swift
//  FlowersShop
//
//  Created by Aleksey Libin on 24.02.2023.
//

import SwiftUI

struct CoordinatorView: View {
  @StateObject private var coordinator = Coordinator()
    var body: some View {
      NavigationStack(path: $coordinator.path) {
        coordinator.build(page: .flowerTypesScreen)
          .navigationDestination(for: Page.self) { page in
            coordinator.build(page: page)
          }
          .sheet(item: $coordinator.sheet) { sheet in
            coordinator.build(sheet: sheet)
          }
      }
      .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
