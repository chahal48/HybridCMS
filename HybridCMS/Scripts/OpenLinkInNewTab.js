function fnRedirect(url) {
    var host = window.location.origin;
    var pathname = host + encodeURI("/@" + url);
    window.open(pathname, '_blank');
}
function fnRedirectToLogin() {
    var host = window.location.origin;
    var pathname = host + '/User/Login';
    window.open(pathname);
}