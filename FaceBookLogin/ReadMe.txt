
Read this
https://developers.facebook.com/docs/ios/getting-started

to add facebook app
https://developers.facebook.com/apps

read it
https://developers.facebook.com/docs/facebook-login/ios

dashboard
https://developers.facebook.com/apps/<some#here>/dashboard/

Dependency framework ------------------------------------------------------------------
Bolts.framework
FBSDKLoginKit.framework
FBSDKCoreKit.framework

info.plist ---------------------------------------------------------------------------

Add this code inside <dict> and <dict>
Example

<dict>
...... Some Code ..........
<key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>fbsomefb#here</string>
            </array>
        </dict>
    </array>
    <key>FacebookAppID</key>
    <string>somefb#here</string>
    <key>FacebookDisplayName</key>
    <string>IOSApp</string>
    
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>fbapi</string>
        <string>fb-messenger-api</string>
        <string>fbauth2</string>
        <string>fbshareextension</string>
    </array>
...... Some Code ..........
</dict>   
    

    
    