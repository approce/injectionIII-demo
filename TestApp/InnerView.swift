import Foundation
import SwiftUI

struct InnerView: View {
    @ObservedObject var iO = injectionObserver

    var body: some View {
        Text("Inner View")
                .eraseToAnyView()
    }
}