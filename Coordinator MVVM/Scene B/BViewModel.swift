import Foundation

class BViewModel: ViewModelB {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(fullName: String, birthDay: String) {
        coordinator.navigateTo(screen: .C(BModel(fullName: fullName, birthDay: birthDay)))
    }
}
