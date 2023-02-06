function fnRedirect(url) {

    var host = window.location.origin;
    var pathname = host + encodeURI("/@" + url);
    window.open(pathname, '_blank');
}