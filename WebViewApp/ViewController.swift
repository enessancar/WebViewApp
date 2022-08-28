
import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate, UITextFieldDelegate {

    @IBOutlet weak var buttonBack: UIBarButtonItem!
    @IBOutlet weak var buttonGo: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBack.isEnabled = false
        buttonGo.isEnabled = false
        
        textField.delegate = self
        webView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let urlString = "https://youtube.com"
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        webView.load(request)
        
        textField.text = urlString
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        buttonBack.isEnabled = webView.canGoBack
        buttonGo.isEnabled = webView.canGoForward
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString = textField.text!
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        webView.load(request)
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func buttonBack(_ sender: UIBarButtonItem) {
        
        if webView.canGoBack == true {
            webView.goBack()
            textField.text = webView.url?.absoluteString
        }
    }
    
    @IBAction func buttonGo(_ sender: UIBarButtonItem) {
        
        if webView.canGoForward == true {
            webView.goForward()
            textField.text = webView.url?.absoluteString
        }
        
    }
    
    

}

