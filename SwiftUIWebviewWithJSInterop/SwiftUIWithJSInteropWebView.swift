//
//  Created by GordonOnGithub on 1/12/2023.
//
import Foundation
import SwiftUI

public struct SwiftUIWithJSInteropWebView: View {

  public init(viewModel: SwiftUIWithJSInteropWebViewModel) {
    self.viewModel = viewModel
  }

  @ObservedObject
  public var viewModel: SwiftUIWithJSInteropWebViewModel

  public var body: some View {

    WKWebViewWrapper(
      script: $viewModel.script, url: $viewModel.url,
      webViewConfiguration: viewModel.webViewConfiguration, navigationDelegate: nil)
  }

}
