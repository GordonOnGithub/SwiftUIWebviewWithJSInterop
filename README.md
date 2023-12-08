# SwiftUIWebviewWithJSInterop
A `WKWebView` wrapper for `SwiftUI` with Javascript interoperability.

# How To Use
1. Create `SwiftUIWithJSInteropWebViewModel`, specify message handlers and the webview's URL.
```swift
  let url = URL(string: "your_webview_url")!
  
  let viewModel = SwiftUIWithJSInteropWebViewModel(url: url, messageHandlerNames: ["yourMessageHander"])
```

2. Include `SwiftUIWithJSInteropWebView` along with `SwiftUIWithJSInteropWebViewModel` in your SwiftUI view.
```swift
struct ContentView: View {

  var body: some View {
    SwiftUIWithJSInteropWebView(viewModel: viewModel, navigationDelegate: nil)
  }
}
```

3. Assign object that conforms `SwiftUIWithJSInteropWebViewModelDelegate` as `SwiftUIWithJSInteropWebViewModel`'s delegate to handle messages from the webview.

4. Evaluate javascript and load another URL into the webview via `SwiftUIWithJSInteropWebViewModel` as `WebviewInteropInterface`.

Check demo app project `SwiftUIWebviewWithJSInteropDemo` for complete code example.
