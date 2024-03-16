//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

//! Input handler for the attention view
class asmallahDelegate extends WatchUi.InputDelegate {
    private var _view as asmallahView;

    //! Constructor
    //! @param view The app view
    public function initialize(view as asmallahView) {
        InputDelegate.initialize();
        _view = view;
    }

    //! Handle key events
    //! @param evt The key event that occurred
    //! @return true if handled, false otherwise
    public function onKey(evt as KeyEvent) as Boolean {
        var key = evt.getKey();
        if (WatchUi.KEY_DOWN == key) {
            _view.nextIsm();
        } else if (WatchUi.KEY_UP == key) {
            _view.precedentIsm();
        } else {
            return false;
        }
        //WatchUi.requestUpdate();
        return true;
    }
}
