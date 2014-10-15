//
//  RootViewController.swift
//  HttpClient
//
//  Created by Derek Li on 14-10-15.
//  Copyright (c) 2014年 Derek Li. All rights reserved.
//

import UIKit

class RootViewController: ViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get demo
        var dl=HttpClient()
        var url="http://m.weather.com.cn/data/101010100.html"
        dl.downloadFromGetUrl(url, completionHandler: {(data: NSData?, error: NSError?) -> Void in
            if (error != nil){
                println("error=\(error!.localizedDescription)")
            }else{
                var dict=NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers, error:nil) as? NSDictionary
                println("get_dict=\(dict)")
            }
        })
        
        
        
        //post demo(不带NSData)
        dl=HttpClient()
        url="http://m.weather.com.cn/data/101010100.html"
        var dic=["q":"宾馆"]
        dl.downloadFromPostUrl(url, dic: dic, completionHandler: {(data: NSData?, error: NSError?) -> Void in
            if (error != nil){
                println("error")
                println("error=\(error!.localizedDescription)")
            }else{
                println("success")
                var dict=NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers, error:nil) as? NSDictionary
                println("post_dict=\(dict)")
            }
        })
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}