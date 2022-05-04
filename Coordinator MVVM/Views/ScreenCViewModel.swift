import Foundation

class ScreenCViewModel {
    weak var coordinator: MainCoordinator!
    
    func goToScreenA() {
        coordinator.goToA()
    }
}
