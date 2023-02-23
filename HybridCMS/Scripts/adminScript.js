$("document").ready(function () {
    $("#filterTable").dataTable({
        "searching": true,
        order: [],
        pageLength: 5,
        lengthMenu: [[5, 15, 30, -1], [5, 15, 30, 'All']],
        "columns": [
            null,
            null,
            null,
            null,
            null,
            { "width": "30%" }
        ]
    });
    var table = $('#filterTable').DataTable();
    $("#filterTable_filter.dataTables_filter").append($("#categoryFilter"));
    /*$("#filterTable_filter.dataTables_filter").append($("#btnCreateBlog"));*/
    var categoryIndex = 2;
    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var selectedItem = $('#categoryFilter').val()
            var category = data[categoryIndex];
            if (selectedItem === "" || category.includes(selectedItem)) {
                return true;
            }
            return false;
        }
    );
    $("#categoryFilter").change(function (e) {
        table.draw();
    });
    table.draw();
});
$(document).ready(function () {
    $('#liAdminDashboard').addClass('active');
});

function fnPublishAssets(AssetId, IsPublished, cb) {
    const lPublished = IsPublished.toLowerCase() == "true" ? true : false;

    $.ajax({
        url: '/Asset/IsPublish',
        method: 'POST',
        data: {
            AssetId: AssetId
        },
        success: function (res) {
            /*console.log(res);*/
            if (res.success) {
                //console.log("success");
                if (res.message) {
                    $(cb).prop("checked", res.message);
                    alert('Asset is published successfully.');
                    window.location.pathname = 'CMS';
                }
                else if (!res.message) {
                    $(cb).prop("checked", res.message);
                    alert('Asset is reverted to archived successfully.');
                    window.location.pathname = 'CMS';
                }
                else {
                    $(cb).prop("checked", lPublished);
                    alert('Somthing went wrong... Please try again.');
                }
            }
            else {
                $(cb).prop("checked", lPublished);
                alert('Somthing went wrong... Please try again.');
            }
        },
        error: function (error) {
            //console.log(error);
            $(cb).prop("checked", lPublished);
            alert('Somthing went wrong... Please try again.');
        }
    })
}