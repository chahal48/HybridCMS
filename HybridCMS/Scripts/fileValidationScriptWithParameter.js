function fileValidation(Picture) {
    const alertMessage = "Invalid file type!! \nOnly files with the following extension are allowed :  jpg jpeg png gif.";
    var baseUrl = document.location.origin;
    if (Picture.includes(".jpg") || Picture.includes(".jpeg") || Picture.includes(".png") || Picture.includes(".gif")) {
        var DefaultImagePath = baseUrl + '/Upload/' + Picture;
    }
    else {
        var DefaultImagePath = baseUrl + '/Upload/NoImage.png';
    }
    var fileInput = document.getElementById('Image');
    var filePath = fileInput.value;
    // Allowing file type
    var allowedExtensions =
        /(\.jpg|\.jpeg|\.png|\.gif)$/i;
    if (!allowedExtensions.exec(filePath)) {
        alert(alertMessage);
        fileInput.value = null;
        var DefaultImage = document.getElementById('imagePreview');
        $(DefaultImage).attr('src', DefaultImagePath);
        return false;
    }
    else {
        // Image preview
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var Preview = document.getElementById('imagePreview');
                $(Preview).attr('src', e.target.result);
            };
            reader.readAsDataURL(fileInput.files[0]);
        }
    }
}