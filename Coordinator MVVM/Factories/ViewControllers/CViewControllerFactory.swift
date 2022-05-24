import Foundation
import UIKit

func makeCViewController(coordinator: MainCoordinator, bModel: BModel) -> CViewController {
    CViewController(viewModel: CViewModel(coordinator: coordinator), bModel: bModel)
}
