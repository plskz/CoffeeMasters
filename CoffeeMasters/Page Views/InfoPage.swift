//  Date: 12/27/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI
import WebKit

class WebInterfaceDialogs: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
}

struct WebView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.userContentController.add(WebInterfaceDialogs() , name: "alert")
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let url = URL(string: "https://firtman.github.io/coffeemasters/webapp")!
        webView.load(URLRequest(url: url))
        
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        webView.evaluateJavaScript("injectFormData('\(name)')")
    }
}

struct InfoPage: View {
    var body: some View {
        WebView()
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
