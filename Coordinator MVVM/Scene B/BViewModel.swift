import Foundation

class BViewModel: ViewModelB {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(fullName: String, birthDay: String) {
        coordinator.navigateTo(screen: .C, model: BModel(fullName: fullName, birthDay: birthDay))
    }
}
