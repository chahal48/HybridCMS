$(function () {
    $("#BlogTitle").focus();
});
var Title = document.getElementById('BlogTitle');
var URL = document.getElementById('URL');
Title.addEventListener('input', function (event) {
    var r = /[^a-z.]/gi;
    var key = event.key;
    URL.value = this.value.replace(r, '');
    if (!r.test(key)) {
        return;
    }
})
$('#URL').bind('input', function () {
    var c = this.selectionStart,
        r = /[^a-z.]/gi,
        v = $(this).val();
    if (r.test(v)) {
        $(this).val(v.replace(r, ''));
        c--;
    }
    this.setSelectionRange(c, c);
});