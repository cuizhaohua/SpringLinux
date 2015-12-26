/*
 * platform specific native functions
 */

function do_tryagain() {
    window.external.offlineErrorTryAgain();
}

function do_menu() {
    var menu_buttons = document.getElementsByClassName("notional-settings-button");

    if (menu_buttons.length > 0)
    {
        var menu_button = menu_buttons[0];
        var pos = menu_button.getBoundingClientRect();
        window.external.settingsMenu(pos.left, pos.top, pos.right, pos.bottom);
    }
}

window.ctxs_async_refresh = function()
{
    /* When in offline error mode wire up the refresh button on the menu to
     * Try Again. */
    window.external.offlineErrorTryAgain();
};
