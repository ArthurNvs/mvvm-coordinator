import Foundation
import UIKit

func makeAViewController(coordinator: MainCoordinator) -> HomeViewController {
    HomeViewController(viewModel: HomeViewModel(coordinator: coordinator))
}
