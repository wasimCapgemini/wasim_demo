//
//  ViewController.swift
//  waim_demo
//
//  Created by Wasim Akram on 7/22/22.
//

import UIKit
import ASJCollectionViewFillLayout

class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate  {
    
    @IBOutlet weak var ColVw: UICollectionView!
    var pinchGesture = UIPinchGestureRecognizer()
    var cell1 = CollectionCell()
    var msg = ["20.00", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "40.00", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", "60.00", "70.00", "80.00", "90.00", "100.00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupEventsCollectionView()
        
        
    }
    
    //MARK:- Button Action
    
    @IBAction func pinchRecognized(_ pinch: UIPinchGestureRecognizer) {
        
        self.cell1.addGestureRecognizer(pinchGesture)
        self.cell1.transform = self.cell1.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1.0
        
    }
    
    //MARK:- function
    
    func setupEventsCollectionView(){
        let SCREEN_WIDTH    =   UIScreen.main.bounds.size.width
        let SCREEN_HEIGHT   =   UIScreen.main.bounds.size.height
        let layoutEvents = ASJCollectionViewFillLayout()
        layoutEvents.itemSpacing = 10
        // layoutEvents.stretchesLastItems = true
        layoutEvents.itemLength = SCREEN_WIDTH * 0.7
        layoutEvents.direction = .vertical
        layoutEvents.numberOfItemsInSide = 3
        //   ColVw.setCollectionViewLayout(layoutEvents, animated: true)
        // HomeEventsCollection.register(UINib(nibName: "HomeEventCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeEventCollectionCell")
        
        
    }
    
    //MARK:- collectionVw Delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return msg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.Lbl.text = "€\(msg[indexPath.item])"
        
        
        self.pinchGesture.delegate = self
        cell.Lbl.isUserInteractionEnabled = true
        cell.Lbl.isMultipleTouchEnabled = true
        
        
        
        self.pinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(pinchRecognized(_:)))
        self.cell1.addGestureRecognizer(self.pinchGesture)
        
        cell.Lbl.addGestureRecognizer(self.pinchGesture)
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let SCREEN_WIDTH    =   UIScreen.main.bounds.size.width
        
        let size: CGSize = msg[indexPath.item].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
        // return CGSize(width: size.width + 45 , height: 40)
        
        return CGSize(width: self.view.frame.size.width / 3.2 , height:  SCREEN_WIDTH * 0.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let selectedCell = ColVw.cellForItem(at: indexPath)  as? CollectionCell
        ColVw.bringSubviewToFront(selectedCell!)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            selectedCell?.transform = CGAffineTransform(scaleX: 1.2, y: 2)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell = ColVw.cellForItem(at: indexPath)  as? CollectionCell
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            unselectedCell?.transform = .identity
        })
    }
    
    
}

