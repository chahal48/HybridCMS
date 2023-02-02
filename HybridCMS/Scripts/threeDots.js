function uncheckThreeDots() {
    var uncheck = document.getElementsByClassName('three-dot-checkbox');
    for (var i = 0; i < uncheck.length; i++) {
        if (uncheck[i].type == 'checkbox') {
            uncheck[i].checked = false;
        }
    }
}
/*
 $('.three-dot-checkbox').on('mouseenter', function () {
    this.checked = true;
});
*/

$('.close-three-dot-checkbox').on('mouseleave', function () {
    setTimeout("uncheckThreeDots()", 500);
});