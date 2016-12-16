//
//  CustomLoader.swift
//  Pods
//
//  Created by Karthik on 15/12/16.
//
//

import Foundation
import PodAsset


extension UIView{
    
    static func view(FromNib nib: String? = "Loader") -> UIView?{
     
        guard let podBundle = PodAsset.bundle(forPod: "MyCustomLoader"),
            let nib = podBundle.loadNibNamed("Loader", owner: self, options: nil)  else{
                
            fatalError()
        }
    
        return nib.first as! UIView
    }
}


class Loader: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func initLoader(forView view: UIView) -> Loader{
        
        let instance = Loader.view(FromNib: "Loader") as! Loader
        return instance
    }
    
    func show(){
        
        self.isHidden = false
        self.activityIndicator.startAnimating()

        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut, animations: {
            self.alpha = 1.0
        })
    }
    
    func hide(){
        
        self.isHidden = true
        self.alpha = 0.0
        
        UIView.animate(withDuration: 0, animations: {
        
            self.activityIndicator.stopAnimating()
            
        }, completion: { (finished) in

            self.removeFromSuperview()
        })
    }
}



public class CustomLoader: NSObject {
    
    
    //Public Properties
    public var backgroundClr: UIColor = {
        return UIColor.lightGray
    }()
    
    public var cornerRaduis: CGFloat = {
        return 4
    }()
    
    public var activityIndicatorStyle: UIActivityIndicatorViewStyle = {
        return .whiteLarge
    }()
    
    public var indicatorColor: UIColor = {
        return .darkGray
    }()
    
    
    //private Properties
    private var loader: Loader?
    
    var sourceView : UIView?
    
    required public init(forView view: UIView) {
        sourceView = view
    }
    
    private func createLoader(){
        
        guard let source = sourceView else{
            fatalError()
        }
    
        self.loader?.removeFromSuperview()
        
        //Creating Loader
        self.loader = Loader.initLoader(forView: source)
        self.loader!.center = source.center
        
        //Activity Indicator
        self.loader!.activityIndicator.activityIndicatorViewStyle = activityIndicatorStyle
        self.loader!.activityIndicator.color = indicatorColor
        
        self.loader!.layer.cornerRadius = cornerRaduis
        self.loader!.backgroundColor = backgroundClr
  
        source.bringSubview(toFront: self.loader!)
        source.addSubview(self.loader!)
    }
    
    public func showLoader(){
    
        self.createLoader()
        self.loader?.show()
    }
    
    public func hideLoader(){
        
        guard let loadingView = self.loader else {
            print("Warning: Loading view unavailable")
            return
        }
        
        loadingView.hide()
        loadingView.removeFromSuperview()
        self.loader = nil
    }
}
