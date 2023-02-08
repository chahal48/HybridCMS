function deletePost(assetUrl, postId, btn) {
    const confirmText = "Are you sure you want to remove this from Saved Posts?";
    if (confirm(confirmText)) {

        $.ajax({
            url: '/Post/Delete',
            method: 'POST',
            data: { PostId: postId},
            success: function (res) {
                console.log(res);
                if (res.success) {
                    alert('Post deleted successfully.');
                    $(btn).parents('div.close-three-dot-checkbox').remove();
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
}