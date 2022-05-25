import Foundation
import UIKit

func makeCViewController(coordinator: MainCoordinator, birthDayModel: BirthDayModel) -> PersonInfoViewController {
    PersonInfoViewController(viewModel: PersonInfoViewModel(coordinator: coordinator), birthDayModel: birthDayModel)
}
