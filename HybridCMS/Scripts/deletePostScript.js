function deletePost(assetUrl,postId) {
    $.ajax({
        url: '/Post/Delete',
        method: 'POST',
        data: { PostId: postId},
        success: function (res) {
            console.log(res);
            if (res.success) {
                alert('Post deleted successfully.');
                fnRedirect(assetUrl);
            }
            else {
                alert('Somthing went wrong... Please try again.');
            }
        },
        error: function (error) {
            //console.log(error);
            alert('Somthing went wrong... Please try again.')
        }
    })
}