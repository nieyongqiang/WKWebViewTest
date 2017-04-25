//
//  ViewController.swift
//  WKWebViewTest
//
//  Created by 宇纳科技 on 16/4/5.
//  Copyright © 2016年 宇纳科技. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    
    var webView: WKWebView!

    @IBOutlet weak var containerView: UIWebView!
    
    override func loadView() {
        super.loadView()
        // 获得WK控制管理器
        let contentController = WKUserContentController()
        // 通过控制管理器来添加js对象
        // html页面可以通过window.webkit.messageHandlers.phone.proessMessage('XXXX')来调用
        contentController.add(self, name: "phone")
        // 获得WKWebView配置构造器
        let config = WKWebViewConfiguration()
        // 设置控制器
        config.userContentController = contentController
        // 构造一个WKWebView
        // 第一个参数是CGRECT类型，意思就是构造容器范围，self.containerView.bounds是UIWebView的大小，
        // 这样WKWebView的大小就与UIWebView 大小一致
        self.webView = WKWebView(frame: self.containerView.bounds, configuration: config)
        // 将WKWebView添加到UIWebView容器中，这样可以保证布局的一致性，
        // 因为有的时候我们可能需要预留出顶部导航栏这时我们是需要UIWebView来进行调整
        self.containerView.addSubview(self.webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 指定地址
        let url = URL(string : "http://baidu.com");

        // 请求
        let request = URLRequest(url : url!);
        // 加载请求
        self.webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /**
     *  此方法为js接收参数（方法名不可变，改变WKScriptMessageHandler引入会出现错误）
     */
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //
        print(message.name);
        print(message.body)
        
    }

}

