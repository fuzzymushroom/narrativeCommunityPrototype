//
//  SKMultilineLabel.swift
//
//  Created by Craig on 10/04/2015.  Modified by Max.
//  Copyright (c) 2015 Interactive Coconut. All rights reserved.
//

import SpriteKit

class SKMultilineLabel: SKNode {
    
    //props
    var text:String {didSet {update()}}
    var labelWidth:CGFloat {didSet {update()}}
    var textStyle:TextStyle {didSet {update()}}
    var shapeStyle:ShapeStyle? {didSet {update()}}
    var padding:CGFloat {didSet {update()}}
    
    //display objects
    var rect:SKShapeNode?
    private var labels:[SKLabelNode] = []
    
    init(text:String, labelWidth:CGFloat, textStyle:TextStyle, shapeStyle:ShapeStyle? = nil, padding:CGFloat){
        self.text = text
        self.labelWidth = labelWidth
        self.textStyle = textStyle
        self.shapeStyle = shapeStyle
        self.padding = padding
        
        super.init()
        self.update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        if (labels.count>0) {
            for label in labels {
                label.removeFromParent()
            }
            labels = []
        }
        let separators = NSCharacterSet.whitespacesAndNewlines
        let words = text.components(separatedBy: separators)
        
        var finalLine = false
        var wordIndex = -1
        var lineCount = 0
        while (!finalLine) {
            lineCount += 1
            var lineLength = CGFloat(0)
            var lineString = ""
            var lineStringBeforeAddingWord = ""
            
            // creation of the SKLabelNode itself
            let label = SKLabelNode(fontNamed: textStyle.fontName)
            // name each label node so you can animate it if u wish
            label.name = "line\(lineCount)"
            label.horizontalAlignmentMode = textStyle.alignment
            label.fontSize = textStyle.fontSize
            label.fontColor = textStyle.fontColor
            
            while lineLength < CGFloat(labelWidth) {
                wordIndex += 1
                if wordIndex > words.count-1 {
                    //label.text = "\(lineString) \(words[wordCount])"
                    finalLine = true
                    break
                } else {
                    lineStringBeforeAddingWord = lineString
                    lineString = "\(lineString) \(words[wordIndex])"
                    label.text = lineString
                    lineLength = label.frame.size.width
                }
            }
            if lineLength > 0 {
                wordIndex -= 1
                if (!finalLine) {
                    if lineStringBeforeAddingWord == "" {
                        print("Words don't fit! Decrease the font size of increase the labelWidth (\"\(lineString)\")")
                        break
                    }
                    lineString = lineStringBeforeAddingWord
                }
                label.text = lineString
                var linePosition = CGPoint.zero
                if (textStyle.alignment == .left) {
                    linePosition.x -= CGFloat(labelWidth / 2.0)
                } else if (textStyle.alignment == .right) {
                    linePosition.x += CGFloat(labelWidth / 2.0)
                }
                linePosition.y += -padding + CGFloat(-textStyle.leading * lineCount)
                label.position = linePosition
                label.zPosition = 1
                self.addChild(label)
                labels.append(label)
                //println("was \(lineLength), now \(label.frame.size.width)")
            }
            
        }

        let rectHeight = CGFloat(lineCount * textStyle.leading) + padding * 2.0
        showFrame(rectHeight: rectHeight)
    }
    
    private func showFrame(rectHeight:CGFloat) {
        if let shapeStyle = self.shapeStyle {
            self.rect?.removeFromParent()
            let rect = SKShapeNode(rectOf: CGSize(width: labelWidth + padding*2.0, height: rectHeight))
            rect.fillColor = shapeStyle.fillColor
            rect.strokeColor = shapeStyle.strokeColor
            rect.lineWidth = shapeStyle.strokeWidth
            rect.position = CGPoint(x: 0, y: -rectHeight / 2.0)
            self.rect = rect
            self.addChild(rect)
        }
    }
}
