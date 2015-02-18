//
//  ofxAppleScriptUtility.h
//
//  Created by ISHII 2bit on 2015/02/18.
//

#pragma mark
#include "ofxAppleScript.h"

static void ofxASiMessage(const string &text, const string &telephone, const string &mail) {
    string str = string("tell application \"Messages\"\n")
               + "    launch\n"
               + "    send \"" + text + "\" to buddy \"" + telephone + "\" of service \"E:" + mail + "\"\n"
               + "end tell";
    ofxRunAppleScript(str);
}