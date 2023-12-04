import Foundation
import SwiftUIWebviewWithJSInterop
import WebKit

class MyInteropHandler: SwiftUIWithJSInteropWebViewModelDelegate {

  let messageHanderName = "webAppContainerMessageHandler"

  weak var webviewInteropInterface: SwiftUIWebviewWithJSInterop.WebviewInteropInterface?

  func swiftUIWithJSInteropWebViewModel(
    _ viewModel: SwiftUIWebviewWithJSInterop.SwiftUIWithJSInteropWebViewModel,
    didReceiveMessageFromWebView message: WKScriptMessage
  ) {
    /*
         // post a message from web to this app with the corresponding message handler, e.g. :

        if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.webAppContainerMessageHandler) {
            window.webkit.messageHandlers.myMessageHandler.postMessage({
            "message": message
            });
        }
    */
    print("Message name: \(message.name), body: \(message.body)")

    // response to webview by evaluating javascript
    let javascript =
      "var event = new CustomEvent('customevent', { 'detail' : {'foo':'bar'}} ); window.dispatchEvent(event);"
    webviewInteropInterface?.evaluateJavascript(javascript: javascript)
  }
}
