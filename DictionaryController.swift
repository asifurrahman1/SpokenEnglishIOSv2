//
//  Dictionary.swift
//  Test_learning_app
//
//  Created by Md Asifur Rahman on 9/8/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class DictionaryController:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UISearchBarDelegate{
    
    var dictionarywords: [DictionaryWord]?
    
    var filteredword:[DictionaryWord]?
    var inSearchMode = false
    
    func setDictionary(){
        
        let w1 = DictionaryWord()
        w1.word = "Aback"
        w1.meaning = "Meaning of the w1"
        let w2 = DictionaryWord()
        w2.word = "Abide"
        w2.meaning = "Meaning of the w1"
        let w3 = DictionaryWord()
        w3.word = "Abort"
        w3.meaning = "Meaning of the w1"
        let w4 = DictionaryWord()
        w4.word = "Abomination"
        w4.meaning = "Meaning of the w1"
        let w5 = DictionaryWord()
        w5.word = "Cat"
        w5.meaning = "Meaning of the w1"
        let w6 = DictionaryWord()
        w6.word = "Category"
        w6.meaning = "Meaning of the w1"
        
        dictionarywords = [w1,w2,w3,w4,w1,w1,w1,w1,w1,w2,w2,w2,w3,w3,w3,w5,w6]
    }
    
    
    
    var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.barTintColor = Colors.SearchBarColor//UIColor(red: 51/255, green: 102/255, blue: 240/255, alpha: 1)
        sb.placeholder = "Enter Your Word to search"
        return sb
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    
    
    let cellId = "cellId"
    
    /*
     func fetchVideos() {
     ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
     self.videos = videos
     self.collectionView.reloadData()
     
     }
     }
     */
    
    
    override func setupViews() {
        super.setupViews()
        
        //  fetchVideos()
        setDictionary()
        addSubview(searchBar)
        addConstraintsWithFormat("H:|[v0]|", views: searchBar)
        addConstraintsWithFormat("V:|-2-[v0]", views: searchBar)
        addConstraint(NSLayoutConstraint(item: searchBar, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 40))
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|-45-[v0]|", views: collectionView)
        collectionView.registerClass(DictionaryCell.self, forCellWithReuseIdentifier: cellId)
        searchBar.delegate = self
    }
    
    
    //************************SEARCH CODE FOR SEARCHBAR******************************
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            collectionView.reloadData()
        }
        else{
            inSearchMode = true
            
            filteredword = dictionarywords?.filter({( aObject: DictionaryWord) -> Bool in
                
                return (aObject.word!.lowercaseString.rangeOfString(searchText.lowercaseString) != nil)
            })
            
            collectionView.reloadData()
        }
    }
    //********************************************************************************
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode{
            
            return filteredword?.count ?? 0
        }
        else{
            return dictionarywords?.count ?? 0
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)as! DictionaryCell
        
        if inSearchMode{
            cell.word = filteredword?[indexPath.item]
            return cell
        }
        else{
            cell.word = dictionarywords?[indexPath.item]
            return cell
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(frame.width, 40)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    
    
}

