import Foundation

class BViewModel: ViewModelB {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(fullName: String, birthDay: String) {
        coordinator.goToC(BModel(fullName: fullName, birthDay: birthDay))
    }
}
