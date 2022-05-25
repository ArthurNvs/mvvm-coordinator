import Foundation
import UIKit

func makeBirthDayViewController(coordinator: MainCoordinator, homeModel: HomeModel) -> BirthDayViewController {
    BirthDayViewController(viewModel: BirthDayViewModel(coordinator: coordinator), homeModel: homeModel)
}
