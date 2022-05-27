import Foundation
import UIKit

func makeHomeViewController(coordinator: MainCoordinator) -> HomeViewController {
    HomeViewController(viewModel: HomeViewModel(coordinator: coordinator))
}
