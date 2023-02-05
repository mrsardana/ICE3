import GameplayKit
import SpriteKit

class CollisionManager
{
    // get a reference to the GameViewcontroller
    
    public static var gameViewController : GameViewController?
    
    // Utility function
    public static func SquaredDistance(point1 : CGPoint, point2 : CGPoint) -> CGFloat
    {
        let Xs : CGFloat = point2.x - point1.x
        let Ys : CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    //Collison function
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject)
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        // collision check
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii)
        {
            // we have collison
            if(!object2.isColliding!)
            {
                // if object2 is not already colliding
                switch(object2.name)
                {
                case "island":
                    print("Colliding with Island")
                    break
                case "cloud":
                    print("Colliding with Cloud")
                    break
                default:
                    break
                }
                
                object2.isColliding = true
            }
        }
    }
}