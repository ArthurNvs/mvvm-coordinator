import Foundation
import UIKit

func makeCViewController(coordinator: MainCoordinator, birthDayModel: BirthDayModel) -> CViewController {
    CViewController(viewModel: CViewModel(coordinator: coordinator), birthDayModel: birthDayModel)
}
