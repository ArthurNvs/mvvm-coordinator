import Foundation
import UIKit

func makeAViewController(coordinator: MainCoordinator) -> AViewController {
    AViewController(viewModel: AViewModel(coordinator: coordinator))
}
