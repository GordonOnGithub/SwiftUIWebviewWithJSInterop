//
//  Created by GordonOnGithub on 1/12/2023.
//
import Foundation
import SwiftUI
import UIKit
import WebKit

struct WKWebViewWrapper: UIViewRepresentable {
  typealias UIViewType = WKWebView

  @Binding
  var script: String

  @Binding
  var url: URL?

  let webViewConfiguration: WKWebViewConfiguration

  func makeUIView(context: Context) -> UIViewType {

    let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)

    webView.navigationDelegate = context.coordinator

    return webView
  }

  func updateUIView(_ webView: UIViewType, context: Context) {

    if !self.script.isEmpty {

      webView.evaluateJavaScript(self.script) { result, error in
        if let error {
          print(error)
        }
      }
      DispatchQueue.main.async {
        self.script = ""
      }
    }

    if let url {
      webView.load(URLRequest(url: url))
      DispatchQueue.main.async {
        self.url = nil
      }
    }

  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WKWebViewWrapper

    init(_ parent: WKWebViewWrapper) {
      self.parent = parent
    }

  }

}
