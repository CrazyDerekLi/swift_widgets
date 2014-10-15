//
//  DemoViewController.swift
//  HttpClient
//
//  Created by Derek Li on 14-10-15.
//  Copyright (c) 2014年 Derek Li. All rights reserved.
//

import Foundation
import UIKit

class DemoViewController: ViewController {
    
    var getRequestBtn:         UIButton!
    var postRequestBtn:         UIButton!
    var getRequestLabel:         UITextView!
    var postRequestLabel:         UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViewStyle()
        
       
        self.view.addSubview(getRequestBtn)
        self.view.addSubview(postRequestBtn)
        self.view.addSubview(getRequestLabel)
        self.view.addSubview(postRequestLabel)
        
        
        
        
        
        //post demo(带NSData)
        
        //        dl=HttpClient()
        //        dl.contentType="png"
        //        url="http://api.map.baidu.com/place/uploadImage"
        //        var image=UIImage(named:"test.png")
        //        var data=UIImageJPEGRepresentation(image, 1.0)
        //        var  dict=NSMutableDictionary()
        //        dict.setObject(data, forKey:"image")
        //        dict.setObject("测试的图片", forKey:"decription")
        //        dl.downloadNSDataFromPostUrl(url,dic:dict,completionHandler: {(data: NSData?, error: NSError?) -> Void in
        //            if (error != nil){
        //                println("error=\(error!.localizedDescription)")
        //
        //            }else{
        //                var json=NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers, error:nil) as? NSDictionary
        //                println("post_image_dict=\(json)")
        //            }
        //            
        //        })
    }
    
    func initViewStyle(){
        getRequestBtn = UIButton(frame:CGRect(origin: CGPointMake(50.0, 50.0), size: CGSizeMake(100,30)))
        getRequestBtn.setTitle("测试get请求", forState: UIControlState.Normal)
        getRequestBtn.backgroundColor = UIColor.redColor()
        getRequestBtn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        getRequestBtn.tag = 1
        
        postRequestBtn = UIButton(frame:CGRect(origin: CGPointMake(230.0, 50.0), size: CGSizeMake(100,30)))
        postRequestBtn.setTitle("测试get请求", forState: UIControlState.Normal)
        postRequestBtn.backgroundColor = UIColor.redColor()
        postRequestBtn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        postRequestBtn.tag = 2
        
        getRequestLabel = UITextView(frame:CGRect(origin: CGPointMake(10, 80.0), size: CGSizeMake(210,500)))
        
        postRequestLabel = UITextView(frame:CGRect(origin: CGPointMake(190, 80.0), size: CGSizeMake(210,500)))
        
    }
    
    @IBAction func buttonClick(sender: UIButton!){
        switch(sender.tag){
        case    1:  self.gotoGet()
            break
        case    2:  self.gotoPost()
            break
        default:    break
        }
    }
    
    func gotoGet(){
        // get demo
        var dl=HttpClient()
//        var url="http://m.weather.com.cn/data/101010100.html"
        var url = "http://www.trirand.com/blog/jqgrid/server.php?q=2&_search=false&nd=1413386604916&rows=10&page=1&sidx=id&sord=desc"
        dl.downloadFromGetUrl(url, completionHandler: {(data: NSData?, error: NSError?) -> Void in
            if (error != nil){
                println("error=\(error!.localizedDescription)")
            }else{
                var dict=NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers, error:nil) as? NSDictionary
                println("get_dict=\(dict)")
                self.getRequestLabel.text = "getRequestResult:\(dict)"
            }
        })
    }
    func gotoPost(){
        //post demo(不带NSData)
        var dl=HttpClient()
        var url="http://apps.developermedia.com/Ads/PageTerms/GetTerms"
        var dic=[
            "DmGlobalUserId":"dR7qa73I+Pyc6w5JBB8pow==",
            "numberOfAdsOnPage":1,
            "publisher":"lqm.trirandjqgrid.site",
            "terms":"",
            "title":"jqGrid Demos",
            "url":"http://www.trirand.com/blog/jqgrid/adds4.html"
        ]
        dl.downloadFromPostUrl(url, dic: dic, completionHandler: {(data: NSData?, error: NSError?) -> Void in
            if (error != nil){
                println("error")
                println("error=\(error!.localizedDescription)")
            }else{
                println("success")
                var dict=NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers, error:nil) as? NSDictionary
                println("post_dict=\(dict)")
                self.postRequestLabel.text = "postRequestResult:\(dict)"
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}