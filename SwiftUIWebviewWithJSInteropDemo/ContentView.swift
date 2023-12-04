import SwiftUI
import SwiftUIWebviewWithJSInterop

struct ContentView: View {

  let viewModel = ContentViewModel()

  var body: some View {
    SwiftUIWithJSInteropWebView(viewModel: viewModel.buildSwiftUIWithJSInteropWebViewModel())
  }
}
