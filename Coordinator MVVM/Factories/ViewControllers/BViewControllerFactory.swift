import Foundation
import UIKit

func makeBViewController(coordinator: MainCoordinator, aModel: HomeModel) -> BViewController {
    BViewController(viewModel: BViewModel(coordinator: coordinator), aModel: aModel)
}
