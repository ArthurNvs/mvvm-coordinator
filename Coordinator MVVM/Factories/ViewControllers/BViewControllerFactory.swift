import Foundation
import UIKit

func makeBViewController(coordinator: MainCoordinator, aModel: HomeModel) -> BirthDayViewController {
    BirthDayViewController(viewModel: BirthDayViewModel(coordinator: coordinator), aModel: aModel)
}
