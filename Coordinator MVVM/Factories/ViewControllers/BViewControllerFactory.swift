import Foundation
import UIKit

func makeBViewController(coordinator: MainCoordinator, aModel: AModel) -> BViewController {
    BViewController(viewModel: BViewModel(coordinator: coordinator), aModel: aModel)
}
