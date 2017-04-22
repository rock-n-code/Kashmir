//
//  XibableView.swift
//  KLMCheckInservices
//
//  Created by Javier Cicchelli on 16/11/2016.
//  Copyright © 2016 Rock & Code. All rights reserved.
//

import UIKit

/**
Generic view class that automatically loads a respective XIB file and integrates it into the current view.

- important: This class **must** be used in case it is required to integrate a custom view into a storyboard.
- seealso: For more information on [how to reuse a custom view with xib file in a storyboard](http://stackoverflow.com/questions/30335089/reuse-a-uiview-xib-in-storyboard/37668821#37668821)
*/
public class XibableView: UIView {
    
    // MARK: Initializers

	override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupXib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupXib()
    }
    
    // MARK: Helpers
    
    /// Loads the contents of the xib file into the view as a subview.
    private func setupXib() {
        guard let view = loadViewFromNib() else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    /// Loads the declaration of a view in a xib file into a view.
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nameClass, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView
    }

}
