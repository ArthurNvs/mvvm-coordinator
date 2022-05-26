import Foundation

class BirthDayViewModel: BirthDay {
    var coordinator: Coordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(fullName: String, birthDay: String) {
        coordinator.navigateTo(screen: .C(BirthDayModel(fullName: fullName, birthDay: birthDay)))
    }
}
