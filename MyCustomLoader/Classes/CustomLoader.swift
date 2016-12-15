//
//  CustomLoader.swift
//  Pods
//
//  Created by Karthik on 15/12/16.
//
//

import Foundation
import PodAsset

public class CustomLoader: UIView {
    
    var source: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    private func setupLoader(){
    
    }
    
    public static func getLoader(target: Any) -> CustomLoader{
        
        guard let podBundle = PodAsset.bundle(forPod: "MyCustomLoader"), let xib = podBundle.loadNibNamed("Loader", owner: self, options: nil)  else{
            fatalError()
        }
    
        return xib.first as! CustomLoader
    }
}
