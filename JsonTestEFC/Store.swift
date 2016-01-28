//
//  AppDelegate.swift
//  JsonTestEFC
//
//  Created by eduardo fulgencio on 28/1/16.
//  Copyright © 2016 eduardo fulgencio. All rights reserved.
//

import Foundation

// En esta clase se implementaría el método de llamada remota

public class Store {
  
  public class func getDatosJson(success: ((data: NSData) -> Void)) {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        
      let ubicacionFichero = NSBundle.mainBundle().pathForResource("datos", ofType:"json")
      let data = try! NSData(contentsOfFile:ubicacionFichero!, options: NSDataReadingOptions.DataReadingUncached)
        
      success(data: data)
        
    })
    
  }
  
}

