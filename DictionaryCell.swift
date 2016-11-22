//
//  Dictionary.swift
//  Test_learning_app
//
//  Created by Md Asifur Rahman on 9/8/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class DictionaryCell: BaseCell {
    
    
    var word: DictionaryWord? {
        didSet {
            self.WordLabel.text = word?.word
            self.Meaning.text = word?.meaning
        }
    }
    
    
    
    
    let WordLabel: UILabel = {
        let word = UILabel()
        word.translatesAutoresizingMaskIntoConstraints = false
        word.text = "Aback"
        
        //************COLOR*****************
        word.backgroundColor = UIColor.clearColor()
        word.textColor = .blackColor()
        //*********************************
        
        word.numberOfLines = 1
        return word
    }()
    
    let Meaning: UILabel = {
        let meaning = UILabel()
        meaning.translatesAutoresizingMaskIntoConstraints = false
        meaning.text = "Meaning of the word"
        
        //************COLOR*****************
        meaning.backgroundColor = UIColor.clearColor()
        meaning.textColor = .blackColor()
        //*********************************
        
        return meaning
    }()
    
    
    
    
    let Alphabet: UILabel = {
        let alpha = UILabel()
        alpha.translatesAutoresizingMaskIntoConstraints = false
        alpha.text = "A"
        alpha.textAlignment = .Center
        alpha.backgroundColor = Colors.TopBar//.redColor()
        alpha.textColor = Colors.BodyTextColor//.whiteColor()
        alpha.numberOfLines = 1
        alpha.layer.cornerRadius = 19
        alpha.layer.masksToBounds = true
        alpha.contentMode = .ScaleAspectFill
        return alpha
    }()
    
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        return view
    }()
    
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        
        //************COLOR*****************
        // backgroundColor = UIColor(red: 51/255, green: 102/255, blue: 240/255, alpha: 1)
        //background = UIColor.clearColor()
        //*********************************
        
        addSubview(WordLabel)
        addSubview(Meaning)
        addSubview(separatorView)
        addSubview(Alphabet)
        //--------------------------------------------
        addConstraintsWithFormat("V:|[v0(36)]-1-[v1(1)]|", views: WordLabel,separatorView)
        addConstraintsWithFormat("V:|[v0(36)]-1-[v1(1)]|", views: Meaning,separatorView)
        addConstraintsWithFormat("V:|[v0(38)]|", views: Alphabet)
        //addConstraintsWithFormat("V:", views: separatorView)
        addConstraintsWithFormat("H:|-10-[v0(150)]-5-[v1(250)]", views: WordLabel,Meaning)
        addConstraintsWithFormat("H:[v0(38)]-5-|", views: Alphabet)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        //--------------------------------------------
        
        
    }
}
