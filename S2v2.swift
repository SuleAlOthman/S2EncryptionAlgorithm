import UIKit
//
//  Author : Suleiman Al-Othman ( Social Media Account => @sulealothman )
//  Ver. 1.0
//  S2 Encryption and Decryption Algorithm method
//

class S2v2 {
    
    // Encryption Method
    public func S2Encrypt(Text:String, Password:String) -> String {
        
        let textArr:[UInt16] = Array(Text.utf16)
        let passArr:[UInt16] = Array(Password.utf16)
        let lVar:Int = 128 - passArr.count
        var tCounter:Int = 0
        var pCounter:Int = 0
        var tempCode:Int? = nil
        var result:String = ""
        
        for chr in textArr {
            if(pCounter == passArr.count) { pCounter = 0 }
            if(tCounter == lVar) { tCounter = 0 }
            tempCode = ((Int(chr) + (lVar % (tCounter + 1))) + (Int(passArr[pCounter]) - pCounter))
            result.append(String(Character(UnicodeScalar(tempCode!)!)))
            tCounter += 1
            pCounter += 1
        }
        return result
    }
    
    // Decryption Method
    public func S2Decrypt(Text:String, Password:String) -> String {
        
        let textArr:[UInt16] = Array(Text.utf16)
        let passArr:[UInt16] = Array(Password.utf16)
        let lVar:Int = 128 - passArr.count
        var tCounter:Int = 0
        var pCounter:Int = 0
        var tempCode:Int? = nil
        var result:String = ""
        
        for chr in textArr {
            if(pCounter == passArr.count) { pCounter = 0 }
            if(tCounter == lVar) { tCounter = 0 }
            tempCode = ((Int(chr) - (lVar % (tCounter + 1))) - (Int(passArr[pCounter]) - pCounter))
            if(tempCode! > -1) { result.append(String(Character(UnicodeScalar(tempCode!)!))) }
            tCounter += 1
            pCounter += 1
        }
        return result
    }
}

// Create object for S2v2 Class
var Sv2 = S2v2()

// Example text
var str = "Suleiman Al-Othman"

// Using encryption method
var enc = Sv2.S2Encrypt(Text: str,Password: "sulealothman")

// Using decryption method
var dec = Sv2.S2Decrypt(Text: enc,Password: "sulealothman")

// Show result
print(enc, dec)