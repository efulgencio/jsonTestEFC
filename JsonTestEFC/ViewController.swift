//
//  ViewController.swift
//  JsonTestEFC
//
//  Created by eduardo fulgencio on 28/1/16.
//  Copyright © 2016 eduardo fulgencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
            Store.getDatosJson { (data) -> Void in

                var json : [AnyObject]! = []

                do {
               
                    json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? Array
                    // recorremos el contenido
                    
                    for itemfor in json {
                        // obtenemos cada elemento
                        guard let item = itemfor as? [String: AnyObject],
                            let articulo = item["articulo"] as? [String: AnyObject],
                            let descripcion = articulo["descripcion"] as? String,
                            let unidades = articulo["unidades"] as? Int else {
                                return;
                            }
                        
                        // Una entidad gestionaría esta información 
                        print("El artículo \(descripcion) tiene en el almacén: \(unidades) unidades")
                        
                    }
                    
                    
                } catch {
                    print(error)
                }
            
            }
  
    }

    
}




