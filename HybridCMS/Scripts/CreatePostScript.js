$(function () {
    $("#Heading").focus();
});
$('#createPost').submit(function (e) {
    e.preventDefault();
    if ($(this).valid()) {
        var file = $("#Image").get(0).files;
        var AssetId = $("#AssetId").val();
        var Heading = $("#Heading").val();
        var Description = $("#Description").val();

        var modelObj = new FormData;
        modelObj.append("Image", file[0]);
        modelObj.append("AssetId", AssetId);
        modelObj.append("Heading", Heading);
        modelObj.append("Description", Description);

        createPost(modelObj);
    }
})
function createPost(modelObj) {
    var AssetUrl = $("#AssetUrl").val();

    $.ajax({
        url: '/Post/PostCreate',
        method: 'POST',
        data: modelObj,
        contentType: false,
        processData: false,
        success: function (res) {
            console.log(res);
            if (res.success) {
                alert('Post created successfully');
                fnRedirect(AssetUrl);
            }
            else {
                alert('Somthing went wrong... Please try again.');
            }
        },
        error: function (error) {
            console.log(error);
            alert('Somthing went wrong... Please try again.')
        }
    })
}