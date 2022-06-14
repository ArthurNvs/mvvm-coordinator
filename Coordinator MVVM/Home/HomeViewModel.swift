import Foundation

class HomeViewModel: Home {
    var coordinator: Coordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(firstName: String, lastName: String) {
        coordinator.navigateTo(screen: .B(HomeModel(firstName: firstName, lastName: lastName)))
    }
}
