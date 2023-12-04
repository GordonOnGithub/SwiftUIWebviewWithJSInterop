import Foundation
import SwiftUIWebviewWithJSInterop

class ContentViewModel {

  let handler = MyInteropHandler()

  private var swiftUIWithJSInteropWebViewModel: SwiftUIWithJSInteropWebViewModel?

  func buildSwiftUIWithJSInteropWebViewModel() -> SwiftUIWithJSInteropWebViewModel {

    guard let swiftUIWithJSInteropWebViewModel else {

      let url = URL(string: "")!  // TODO: insert URL here

      swiftUIWithJSInteropWebViewModel = SwiftUIWithJSInteropWebViewModel(
        url: url, messageHandlerNames: [handler.messageHanderName])

      swiftUIWithJSInteropWebViewModel!.delegate = handler

      handler.webviewInteropInterface = swiftUIWithJSInteropWebViewModel

      // TODO: manipulate webViewConfiguration if necessary
      let config = swiftUIWithJSInteropWebViewModel!.webViewConfiguration

      return swiftUIWithJSInteropWebViewModel!
    }

    return swiftUIWithJSInteropWebViewModel
  }

}
