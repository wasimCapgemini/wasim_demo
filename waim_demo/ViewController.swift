//
//  ViewController.swift
//  waim_demo
//
//  Created by Wasim Akram on 7/22/22.
//

import UIKit
import ASJCollectionViewFillLayout

class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var ColVw: UICollectionView!
    var msg = ["20.00", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "40.00", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "60.00", "70.00", "80.00", "90.00", "100.00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupEventsCollectionView()

    }

    func setupEventsCollectionView(){
            let SCREEN_WIDTH    =   UIScreen.main.bounds.size.width
            let SCREEN_HEIGHT   =   UIScreen.main.bounds.size.height
            let layoutEvents = ASJCollectionViewFillLayout()
            layoutEvents.itemSpacing = 10
           // layoutEvents.stretchesLastItems = true
            layoutEvents.itemLength = SCREEN_WIDTH * 0.8
            layoutEvents.direction = .vertical
            layoutEvents.numberOfItemsInSide = 3
            ColVw.setCollectionViewLayout(layoutEvents, animated: true)
           // HomeEventsCollection.register(UINib(nibName: "HomeEventCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeEventCollectionCell")
            
            
        }
    
    //MARK:- collectionVw Delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return msg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.Lbl.text = "€\(msg[indexPath.item])"
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ColVw.reloadData()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        
//        let size: CGSize = msg[indexPath.item].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
//       // return CGSize(width: size.width + 45 , height: 40)
//        
//       // return CGSize(width: self.view.frame.size.width / 3.2 , height: 35)
//    }
    

}

