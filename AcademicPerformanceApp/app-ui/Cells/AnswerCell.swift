//
//  AnswerCell.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {
    
    var liked: Bool!
    var numberOfLikes: Int! {
        didSet {
            likeLabel.text = "\(numberOfLikes ?? 0)"
        }
    }
    
    var itemBuilder = EntityBuilder()
    
    var answer: Answer?
    
    @IBOutlet weak var AcceptButton: UIButton!
    @IBOutlet weak var acceptImage: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var viewForStudent: UIView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBAction func AcceptBitton_Clicked(_ sender: Any) {
        acceptImage.isHidden = !acceptImage.isHidden;
        answer?.accepted = !answer!.accepted!
       // AcceptButton.titleLabel?.text = (answer!.accepted!) ? "Not accept" : "Accept"
        
        let message = ["accepted" : answer?.accepted!, "id" : answer?.id!, "text" : answer?.text!, "questionId" : answer?.questionId!] as [String : Any]
        
        itemBuilder.build(folder: "answers", value: message, id: answer!.id!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        likeLabel.isUserInteractionEnabled = true
        likeImage.isUserInteractionEnabled = true
        likeImage.addGestureRecognizer(tap)
        likeLabel.addGestureRecognizer(tap)
        viewForStudent.addGestureRecognizer(tap)
        viewForStudent.isUserInteractionEnabled = true
    }
    
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if (liked) {
            likeImage.image = UIImage(named: "like")
            numberOfLikes = numberOfLikes - 1
        } else {
            likeImage.image = UIImage(named: "liked")
            numberOfLikes = numberOfLikes + 1
        }
        
        likeLabel.text = "\(numberOfLikes ?? 0)"
        liked = !liked
    }
}
