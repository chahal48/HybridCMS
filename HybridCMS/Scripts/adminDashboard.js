$("document").ready(function () {
    $("#filterTable").dataTable({
        "searching": true,
        order: [],
        pageLength: 10,
        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, 'All']]
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