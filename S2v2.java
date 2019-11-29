package packageexample.example;

/*
 * Author : Suleiman Al-Othman (Social Media Account => @sulealothman)
 * Ver. 1.0
 * S2 Encryption and Decryption Algorithm method
 */

public class example {
    public static void main(String[] args) {
        
        // Example text
        String msg = "Suleiman Al-Othman";
        
        // Create object from S2v2 Class
        S2v2 Sv2 = new S2v2();
        
        // Using encryption method
        String enc = Sv2.S2Encrypt(msg, "sulealothman");
        
        // Using decryption method
        String dec = Sv2.S2Decrypt(enc, "sulealothman");
        
        
        // Show result
        System.out.println(enc);
        System.out.println(dec);
    }
}

class S2v2 {
    
    // Encryption Method
    public String S2Encrypt(String txt,String password) {
        int lvar = 128 - password.length();
        char passArr[] = password.toCharArray();
        int pCounter = 0;
        int tCounter = 0;
        String result = "";
        for(char i: txt.toCharArray()) {
            if(pCounter == password.length()) pCounter = 0;
            if(tCounter == lvar) tCounter = 0;
            result += (char)(((int)i + (lvar % (tCounter + 1))) + ((int)passArr[pCounter] - pCounter));
            pCounter++;
            tCounter++;
        }
        return result;
    }

    // Decryption Method
    public String S2Decrypt(String txt, String password) {
        int lvar = 128 - password.length();
        char passArr[] = password.toCharArray();
        int pCounter = 0;
        int tCounter = 0;
        String result = "";
        for(char i: txt.toCharArray()) {
            if(pCounter == password.length()) pCounter = 0;
            if(tCounter == lvar) tCounter = 0;
            result += (char)(((int)i - (lvar % (tCounter + 1))) - ((int)passArr[pCounter] - pCounter));
            pCounter++;
            tCounter++;
        }
        return result;
    }

}
