import Foundation
import SpriteKit

class Atlasser{
    static var atlases = [String:[SKTexture]]()
    
    static func preloadAtlasNamed(atlasName: String){
        preloadAtlasNamed(atlasName, getTextureNameByIndex: intTo3Chars)
    }
    static func preloadAtlasNamed(atlasName: String, getTextureNameByIndex: (String, Int) -> String){
        let atlas = SKTextureAtlas(named: atlasName)
        var textures = [SKTexture]()
        for i in 1...atlas.textureNames.count {
            let textureName = getTextureNameByIndex(atlasName, i)
            textures.append(atlas.textureNamed(textureName))
        }
        atlases[atlasName] = textures
    }
    static private func intTo3Chars(name:String, i:Int) -> String{
        switch i {
            case 1...9: return name + "_00\(i)"
            case 10...99: return name + "_0\(i)"
            case 100...999: return name + "_\(i)"
            default: fatalError("could not convert int into texture name")
        }
    }
}
