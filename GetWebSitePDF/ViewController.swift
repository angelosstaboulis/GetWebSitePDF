//
//  ViewController.swift
//  GetWebSitePDF
//
//  Created by Angelos Staboulis on 21/12/23.
//

import Cocoa

class ViewController: NSViewController {
    var webView:WebViewKit!
    @IBOutlet weak var txtExportPDF: NSTextField!
    @IBOutlet weak var txtExportURL: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WebViewKit(saveURL: "", loadURL: "")
        // Do any additional setup after loading the view.
    }
    func showAlertBox(){
        let alert = NSAlert()
        alert.alertStyle = .informational
        alert.messageText = "Information Message"
        alert.informativeText = "File was created!!!"
        alert.runModal()
    }
    @IBAction func CmdGetPDF(_ sender: Any) {
        webView.loadURL = txtExportURL.stringValue
        webView.loadWebURL()
        webView.saveURL = txtExportPDF.stringValue
        webView.savePDF()
        showAlertBox()
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

