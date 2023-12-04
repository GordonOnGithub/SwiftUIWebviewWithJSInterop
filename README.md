# SwiftUIWebviewWithJSInterop
A `WKWebView` wrapper for `SwiftUI` with Javascript interoperability.

# How To Use
1. Create `SwiftUIWithJSInteropWebViewModel`, specify message handlers and the webview's URL.
2. Include `SwiftUIWithJSInteropWebView` along with `SwiftUIWithJSInteropWebViewModel` in your SwiftUI view.
3. Assign `SwiftUIWithJSInteropWebViewModelDelegate` as `SwiftUIWithJSInteropWebViewModel`'s delegate to handle message from the webview.
4. Evaluate javascript and load another URL via `SwiftUIWithJSInteropWebViewModel` as `WebviewInteropInterface`.

Check demo app project `SwiftUIWebviewWithJSInteropDemo` for code example.
