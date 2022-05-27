import Foundation
import UIKit

func makePersonInfoViewController(coordinator: MainCoordinator, birthDayModel: BirthDayModel) -> PersonInfoViewController {
    PersonInfoViewController(viewModel: PersonInfoViewModel(coordinator: coordinator), birthDayModel: birthDayModel)
}
