//
//  WebViewKit.swift
//  GetWebSitePDF
//
//  Created by Angelos Staboulis on 21/12/23.
//

import Foundation
import WebKit
class WebViewKit:NSObject,WKNavigationDelegate{
    var saveURL:String
    var loadURL:String
    var webView:WKWebView!
    init(saveURL: String,loadURL:String) {
        self.saveURL = saveURL
        self.loadURL = loadURL
        super.init()
        webView = WKWebView(frame: NSScreen.main!.frame)
        webView.navigationDelegate = self
    }
    func loadWebURL(){
        webView.load(URLRequest(url:URL(string: self.loadURL)!))
    }
    func savePDF(){
        let workItem = DispatchWorkItem {
            self.webView.createPDF { result in
                switch result{
                case .success(let data):
                    FileManager.default.createFile(atPath: self.saveURL, contents: data)
                    break
                case .failure(let error):
                    debugPrint("Error=",error.localizedDescription)
                    break
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.8, execute: workItem)
    }
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let workItem = DispatchWorkItem {
            webView.createPDF { result in
                switch result{
                case .success(let data):
                    FileManager.default.createFile(atPath: self.saveURL, contents: data)
                    break
                case .failure(let error):
                    debugPrint("Error=",error.localizedDescription)
                    break
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.8, execute: workItem)
        
    }
}
