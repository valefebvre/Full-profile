//
//  ViewController.swift
//  FullProfile
//
//  Created by Oscar Falmer on 19/11/16.
//  Copyright © 2016 Oscar Falmer. All rights reserved.
//


/*
 
 https://www.raywenderlich.com/99431/oauth-2-with-swift-tutorial
 
 https://api.fullcontact.com/v3/docs/methods/oauth.exchangeAuthCode
 
 https://github.com/aerogear/aerogear-ios-http
 https://github.com/p2/OAuth2PodApp
 https://github.com/p2/OAuth2
 https://github.com/OAuthSwift/OAuthSwift
 https://github.com/AFNetworking/AFOAuth2Manager
 
 
*/






import UIKit
import Foundation
import Alamofire


//import AeroGearHttp
//import OAuthSwift
import p2_OAuth2

var test = false

// https://github.com/p2/OAuth2

class ViewController: UIViewController, UITextFieldDelegate {
    
    struct Coord { //Coordinates
        var x: CGFloat
        var y: CGFloat
        var width: CGFloat
        var height: CGFloat
        
    }
    
    
    fileprivate var alamofireManager: SessionManager?
    
    var loader: OAuth2DataLoader?
    
    let oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "haJZ9Bab0jQke5ZRA2fmZHpLjgIeSRGG",
        "client_secret": "ld5fFbgA0nIT36V9gXBDpWHEm3O3Zsfk",
        "authorize_uri": "https://app.fullcontact.com/oauth/authorize", //?client-id=haJZ9Bab0jQke5ZRA2fmZHpLjgIeSRGG&redirect_uri=http%3A%2F%2Flocalhost&response-type=code&scope=account.read,contacts.read,contacts.write,tags.read,tags.write&state=foo
        "token_uri": "https://app.fullcontact.com/", // oauth/access_token",  // // code grant only
        "redirect_uris": ["fprofile://oauth/callback"],   // register your own "myapp" scheme in Info.plist
        "scope": "account.read,contacts.read,contacts.write,tags.read,tags.write",
        "response-type": "code",
        "secret_in_body": true,    // Github needs this
        "keychain": false,         // if you DON'T want keychain integration
        ] as OAuth2JSON)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = hexStringToUIColor(hex: "F1F1F1")
        
        
        /*
        
        let base = URL(string: "https://api.github.com")!
        let url = base.appendingPathComponent("user")
        
        var req = oauth2.request(forURL: url)
        req.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        self.loader = OAuth2DataLoader(oauth2: oauth2)
        loader?.perform(request: req) { response in
            do {
                let dict = try response.responseJSON()
                DispatchQueue.main.async {
                    // you have received `dict` JSON data!
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    // an error occurred
                }
            }
        }
 */
        
        
        
        
        
        
        
        
        
        
        let screenW = self.view.bounds.size.width
        //let screenH = self.view.bounds.size.height
        
        let LoginCoord = Coord(x: 0.05*screenW, y:100, width:0.9*screenW, height:0.9*screenW/2.3)
        
        /*
        let LoginView = UIView()
        LoginView.frame = CGRect(x:LoginCoord.x, y:LoginCoord.y, width:LoginCoord.width, height:LoginCoord.height)
        LoginView.backgroundColor = UIColor.white
        LoginView.layer.cornerRadius = 15
        //LoginView.layer.borderWidth = 2
        self.view.addSubview(LoginView)
        
        let EmailTVCoord = Coord(x: LoginCoord.width*0.05, y:0, width:LoginCoord.width*0.9, height:LoginCoord.height/2)
        
        let EmailTF = UITextField()
        EmailTF.frame = CGRect(x: EmailTVCoord.x, y: EmailTVCoord.y, width: EmailTVCoord.width, height: EmailTVCoord.height)
        EmailTF.placeholder = "email"
        EmailTF.font = UIFont.systemFont(ofSize: 20)
        //EmailTF.borderStyle = UITextBorderStyle.roundedRect
        EmailTF.autocorrectionType = UITextAutocorrectionType.no
        EmailTF.keyboardType = UIKeyboardType.default
        EmailTF.returnKeyType = UIReturnKeyType.done
        EmailTF.clearButtonMode = UITextFieldViewMode.whileEditing;
        EmailTF.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        EmailTF.delegate = self
        LoginView.addSubview(EmailTF)
        
        
        
        
        let PsswdTF = UITextField()
        PsswdTF.frame = CGRect(x: EmailTVCoord.x, y: EmailTVCoord.y + EmailTVCoord.height, width: EmailTVCoord.width, height: EmailTVCoord.height)
        PsswdTF.placeholder = "password"
        PsswdTF.font = UIFont.systemFont(ofSize: 20)
        //PsswdTF.borderStyle = UITextBorderStyle.roundedRect
        PsswdTF.autocorrectionType = UITextAutocorrectionType.no
        PsswdTF.keyboardType = UIKeyboardType.default
        PsswdTF.returnKeyType = UIReturnKeyType.done
        PsswdTF.clearButtonMode = UITextFieldViewMode.whileEditing;
        PsswdTF.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        PsswdTF.isSecureTextEntry = true
        PsswdTF.delegate = self
        LoginView.addSubview(PsswdTF)
        
        let lineView = UIView()
        lineView.frame = CGRect(x: EmailTVCoord.x, y: EmailTVCoord.y+EmailTVCoord.height, width: EmailTVCoord.width, height: 1)
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = hexStringToUIColor(hex: "d3d3d3").cgColor
        LoginView.addSubview(lineView)
        
        */
        
        let ButtonCoord = Coord(x:0.1*screenW, y:LoginCoord.x + LoginCoord.y + LoginCoord.height, width:0.8*screenW, height:0.8*screenW/5.4)
        
        let button = UIButton()
        button.frame = CGRect(x:ButtonCoord.x, y: ButtonCoord.y, width:ButtonCoord.width, height:ButtonCoord.height)
        button.backgroundColor = hexStringToUIColor(hex: "4A90E2")
        button.setTitle("Login", for: .normal)
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        let buttonForget = UIButton()
        buttonForget.frame = CGRect(x:ButtonCoord.x, y: ButtonCoord.y + LoginCoord.x + ButtonCoord.height, width:ButtonCoord.width, height:ButtonCoord.height)
        buttonForget.backgroundColor = hexStringToUIColor(hex: "4A90E2")
        buttonForget.setTitle("Forget Token", for: .normal)
        
        buttonForget.clipsToBounds = true
        buttonForget.layer.cornerRadius = 5
        
        buttonForget.addTarget(self, action: #selector(buttonActionForgetToken), for: .touchUpInside)
        self.view.addSubview(buttonForget)
        
        
        
        
        
        
        
        
        /*
        
        var http: Http!
        http = Http()
        
        let googleConfig = GoogleConfig(
            clientId: "YOUR_GOOGLE_CLIENT_ID",                               // [1] Define a Google configuration
            scopes:["https://www.googleapis.com/auth/drive"])                // [2] Specify scope
        
        let gdModule = AccountManager.addGoogleAccount(googleConfig)     // [3] Add it to AccountManager
        self.http.authzModule = gdModule                                 // [4] Inject the AuthzModule
        // into the HTTP layer object
        
        /*let multipartData = MultiPartData(data: self.snapshot(),         // [5] Define multi-part
            name: "image",
            filename: "incognito_photo",
            mimeType: "image/jpg")*/
        let multipartArray =  [] //["file": multipartData]
        
        self.http.POST("https://www.googleapis.com/upload/drive/v2/files",   // [6] Upload image
            parameters: multipartArray,
            completionHandler: {(response, error) in
                if (error != nil) {
                    self.presentAlert("Error", message: error!.localizedDescription)
                } else {
                    self.presentAlert("Success", message: "Successfully uploaded!")
                }
        })
        
        
        */
        
        
    }
    
    // MARK: - Actions
    
    var userDataRequest: URLRequest {
        var request = URLRequest(url: URL(string: "https://api.github.com/user")!)
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        return request
    }
    
    /*
    func didGetUserdata(dict: [String: Any], loader: OAuth2DataLoader?) {
        DispatchQueue.main.async {
            if let username = dict["name"] as? String {
                self.signInEmbeddedButton?.setTitle(username, for: UIControlState())
            }
            else {
                self.signInEmbeddedButton?.setTitle("(No name found)", for: UIControlState())
            }
            if let imgURL = dict["avatar_url"] as? String, let url = URL(string: imgURL) {
                self.loadAvatar(from: url, with: loader)
            }
            self.signInSafariButton?.isHidden = true
            self.signInAutoButton?.isHidden = true
            self.forgetButton?.isHidden = false
        }
    }
    
    func didCancelOrFail(_ error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                print("Authorization went wrong: \(error)")
            }
            self.resetButtons()
        }
    }
    
    func resetButtons() {
        signInEmbeddedButton?.setTitle("Sign In (Embedded)", for: UIControlState())
        signInEmbeddedButton?.isEnabled = true
        signInSafariButton?.setTitle("Sign In (Safari)", for: UIControlState())
        signInSafariButton?.isEnabled = true
        signInSafariButton?.isHidden = false
        signInAutoButton?.setTitle("Auto Sign In", for: UIControlState())
        signInAutoButton?.isEnabled = true
        signInAutoButton?.isHidden = false
        forgetButton?.isHidden = true
    }
*/
    
    func buttonActionForgetToken(sender: UIButton){
        
        oauth2.forgetTokens()
        
    }
    
    func buttonAction(sender: UIButton!) {
        
        
        
        
        if oauth2.isAuthorizing {
            oauth2.abortAuthorization()
            return
        }
        
        //test = true
        
        sender?.setTitle("Authorizing...", for: UIControlState.normal)
        
        //oauth2.authConfig.authorizeEmbedded = true
        //oauth2.authConfig.authorizeContext = self
        
        //oauth2.authConfig.authorizeEmbedded = true
        //oauth2.authConfig.authorizeContext = self
        
        oauth2.logger = OAuth2DebugLogger(.trace)
        
        oauth2.authConfig.authorizeEmbedded = false
        oauth2.authConfig.authorizeContext = self
        
        
        
        // the default
        
        
        //let loader = OAuth2DataLoader(oauth2: oauth2)
        //self.loader = loader
        
        
        
        oauth2.authorize() { authParameters, error in
            if let params = authParameters {
                print("Authorized! Access token is in `oauth2.accessToken`")
                print("Authorized! Additional parameters: \(params)")
            }
            else {
                print("Authorization was cancelled or went wrong: \(error)")   // error will not be nil
            }
        }
        
        /*
        
        loader.perform(request: userDataRequest) { response in
            do {
                let json = try response.responseJSON()
                
                print("JSON OSCAR : ")
                print(json)
                
                self.didGetUserdata(dict: json, loader: loader)
            }
            catch let error {
                
                print("Echec")
                self.didCancelOrFail(error)
            }
        }
 */
        
        /*
        let user = "oscar.falmer@gmail.com"
        let apikey = "a44f0ad5a86f3b68"
        let stringURL = "https://api.fullcontact.com/v3/account.get "
        
        //let stringURL = "https://api.fullcontact.com/v2/person.json?email=oscar.falmer@gmail.com"
        
        
        //let password = ***
        //let credentialData = "\(user):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        //let base64Credentials = credentialData.base64EncodedStringWithOptions([])
        let headers = ["apiKey": apikey]
        
        */
        /*
        Alamofire.request(stringURL, parameters: headers)
            .responseJSON { response  in
                if (response.result.error == nil){
                    print(response)
                }else{
                    print(response)
                }
        }
 
 */

        
        
        
        
        
        
    }
    
    func didGetUserdata(dict: [String: Any], loader: OAuth2DataLoader?) {
        DispatchQueue.main.async {
            
            //print("TEST2016")
            print(dict)
            
            /*
            if let username = dict["name"] as? String {
                //self.signInEmbeddedButton?.setTitle(username, for: UIControlState())
            }
            else {
                //self.signInEmbeddedButton?.setTitle("(No name found)", for: UIControlState())
            }
            if let imgURL = dict["avatar_url"] as? String, let url = URL(string: imgURL) {
                //self.loadAvatar(from: url, with: loader)
            }
            //self.signInSafariButton?.isHidden = true
            //self.signInAutoButton?.isHidden = true
            //self.forgetButton?.isHidden = false
 */
        }
    }
    
    func didCancelOrFail(_ error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                print("Authorization went wrong: \(error)")
            }
            //self.resetButtons()
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //print("TextField did begin editing method called")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //print("TextField did end editing method called")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //print("TextField should begin editing method called")
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        //print("TextField should clear method called")
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //print("TextField should snd editing method called")
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //print("While entering the characters this method gets called")
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }


}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
