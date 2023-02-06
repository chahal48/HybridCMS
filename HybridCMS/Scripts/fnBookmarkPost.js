function fnBookmarkPost(UserId, PostId, IsBookmarked, AssetUrl, cb) {
    const lBookmarked = IsBookmarked.toLowerCase() == "true" ? true : false;

    $.ajax({
        url: '/Post/Bookmark',
        method: 'POST',
        data: {
            UserId: UserId,
            PostId: PostId
        },
        success: function (res) {
            /*console.log(res);*/
            if (res.success) {
                //console.log("success");
                if (res.message || !res.message) {
                    $(cb).prop("checked", res.message);
                }
                else {
                    $(cb).prop("checked", lBookmarked);
                    alert('Somthing went wrong... Please try again.');
                }
            }
            else {
                if (res.message.toLowerCase() == "login") {
                    $(cb).prop("checked", lBookmarked);
                    window.location.pathname = "/User/Login/@@" + AssetUrl;
                }
                else {
                    $(cb).prop("checked", lBookmarked);
                    alert('Somthing went wrong... Please try again.');
                }
            }
        },
        error: function (error) {
            //console.log(error);
            $(cb).prop("checked", lBookmarked);
            alert('Somthing went wrong... Please try again.');
        }
    })
}