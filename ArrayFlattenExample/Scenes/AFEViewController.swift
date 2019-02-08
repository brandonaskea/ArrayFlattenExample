//
//  AFEViewController.swift
//  ArrayFlattenExample
//
//  Created by Brandon Askea on 2/7/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

let defaultBottomConstraintValue:CGFloat = -200
let defaultOutputMessage = "(Press \"Randomize\" to load a new nested array.)"
let animationDuration:Double = 0.8

class AFEViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    @IBOutlet weak var flattenButton: UIButton!
    @IBOutlet weak var flattenButtonBottomConstraint: NSLayoutConstraint!
    
    var nestedArray:[[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array:[Any] = [1,2,3,[4,5,6,],7,8,9,10]
        print(AFEArrayFlattener().flatten(array: array))
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateUI()
    }
    
    // MARK: UI
    
    private func setUpUI() {
        outputLabel.alpha = 0
        updateUIWith(defaultOutputMessage)
        flattenButtonBottomConstraint.constant = defaultBottomConstraintValue
    }
    
    private func animateUI() {
        flattenButtonBottomConstraint.constant = 0
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            UIView.animate(withDuration: animationDuration / 2, animations: {
                self.outputLabel.alpha = 1
            })
        }
    }
    
    private func updateUIWith(_ output: String) {
        outputLabel.text = output
    }
    
    // MARK: Button Input
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        nestedArray = AFEArrayRandomizer().nestedArray()
        updateUIWith(nestedArray.description)
    }
    
    @IBAction func flattenButtonTapped(_ sender: Any) {
        if nestedArray.count == 0 {
            updateUIWith(defaultOutputMessage)
            return
        }
        let flattened = AFEArrayFlattener().flatten(array: nestedArray)
        updateUIWith(flattened.description)
        nestedArray.removeAll()
    }
    
}


