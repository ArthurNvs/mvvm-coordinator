import Foundation

class ScreenBViewModel {
    weak var coordinator: MainCoordinator!
    
    func goToScreenC() {
        coordinator.goToC()
    }
}
