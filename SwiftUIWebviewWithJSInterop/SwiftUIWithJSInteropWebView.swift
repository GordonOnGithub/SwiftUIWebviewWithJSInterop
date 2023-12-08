//
//  Created by GordonOnGithub on 1/12/2023.
//
import Foundation
import SwiftUI
import WebKit

public struct SwiftUIWithJSInteropWebView: View {

  public init(viewModel: SwiftUIWithJSInteropWebViewModel, navigationDelegate: WKNavigationDelegate?
) {
    self.viewModel = viewModel
      self.navigationDelegate = navigationDelegate
  }

  @ObservedObject
  public var viewModel: SwiftUIWithJSInteropWebViewModel

  let navigationDelegate: WKNavigationDelegate?

  public var body: some View {

    WKWebViewWrapper(
      script: $viewModel.script, url: $viewModel.url,
      webViewConfiguration: viewModel.webViewConfiguration, navigationDelegate: navigationDelegate)
  }

}
