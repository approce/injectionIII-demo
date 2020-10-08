import Foundation
import Combine
import SwiftUI

let injectionObserver = InjectionObserver()

class InjectionObserver: ObservableObject {
    @Published var injectionNumber = 0
    var cancellable: AnyCancellable? = nil
    let publisher = PassthroughSubject<Void, Never>()

    init() {
        cancellable = NotificationCenter.default.publisher(for:
                                                           Notification.Name("INJECTION_BUNDLE_NOTIFICATION"))
                                                .sink { [weak self] change in
                                                    self?.injectionNumber += 1
                                                    print("in change \(self?.injectionNumber)")
                                                    self?.publisher.send()
                                                }
    }
}

extension View {
    func eraseToAnyView() -> some View {
        AnyView(self)
    }

    func onInjection(bumpState: @escaping () -> ()) -> some View {
        self.onReceive(injectionObserver.publisher, perform: bumpState)
            .eraseToAnyView()
    }
}