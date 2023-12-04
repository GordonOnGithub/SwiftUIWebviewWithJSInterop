//
//  Created by GordonOnGithub on 1/12/2023.
//
import Combine
import Foundation
import WebKit

public protocol SwiftUIWithJSInteropWebViewModelDelegate: AnyObject {
  func swiftUIWithJSInteropWebViewModel(
    _ viewModel: SwiftUIWithJSInteropWebViewModel,
    didReceiveMessageFromWebView message: WKScriptMessage)
}

public protocol WebviewInteropInterface: AnyObject {
  func evaluateJavascript(javascript: String)
  func loadURL(url: URL)
}

final public class SwiftUIWithJSInteropWebViewModel: NSObject, ObservableObject {

  @Published
  var script: String = ""

  @Published
  var url: URL?

  public weak var delegate: SwiftUIWithJSInteropWebViewModelDelegate?

  let messageHandlerNames: [String]

  public init(url: URL?, messageHandlerNames: [String]) {

    self.messageHandlerNames = messageHandlerNames

    self.url = url

    super.init()
  }

  public lazy var webViewConfiguration: WKWebViewConfiguration = {

    let configuration = WKWebViewConfiguration()

    for messageHandlerName in messageHandlerNames {
      configuration.userContentController.add(self, name: messageHandlerName)
    }
    return configuration

  }()

}

extension SwiftUIWithJSInteropWebViewModel: WebviewInteropInterface {
  public func evaluateJavascript(javascript: String) {
    DispatchQueue.main.async {
      // javascript evaluation is triggered by updating `script`
      self.script.append(javascript)
      // let WKWebViewWrapper clear the script after evaluation
    }
  }

  public func loadURL(url: URL) {
    DispatchQueue.main.async {
      // url loading is triggered by updating `url`
      self.url = url
      // let WKWebViewWrapper clear the url after loading
    }
  }
}

extension SwiftUIWithJSInteropWebViewModel: WKScriptMessageHandler {
  public func userContentController(
    _ userContentController: WKUserContentController, didReceive message: WKScriptMessage
  ) {
    delegate?.swiftUIWithJSInteropWebViewModel(self, didReceiveMessageFromWebView: message)
  }
}
