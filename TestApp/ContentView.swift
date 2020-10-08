import SwiftUI

struct ContentView: View {
    @ObservedObject var iO = injectionObserver

    var body: some View {
        VStack {
            Text("Outer View")
                    .padding()
            InnerView()
        }.eraseToAnyView()
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
}