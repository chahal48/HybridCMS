function GetDataController(tableId) {
    if (($("#usersPanelTable").length && tableId == 1) || ($("#assetsPanelTable").length && tableId == 2) || ($("#postsPanelTable").length && tableId == 3) || ($("#commentsPanelTable").length && tableId == 4)) {
    }
    else {
        loadData(tableId);
    }
}
function loadData(tableId) {
    $.ajax({
        url: '/AdminMaster/TableDataPartial',
        method: 'POST',
        data: { LoadTableId: tableId },
        success: function (res) {
            /*console.log(res);*/
            if (!$.trim(res)) {

            }
            else {
                $('#loadTableData').html(res);
                BindTableData();
            }
        }
    })
}
function ConvertToDateFromJson(ValueInput) {
    var value = new Date
        (
            parseInt(ValueInput.replace(/(^.*\()|([+-].*$)/g, ''))
        );
    var dat =
        value.getDate() +
        "/" +
        (value.getMonth() + 1) +
        "/" +
        value.getFullYear();
    return dat;
}
function showEnableAndDisableBtn() {
    $('#disableBtn').show();
    $('#enableBtn').show();
}
function hideEnableAndDisableBtn() {
    $('#disableBtn').hide();
    $('#enableBtn').hide();
}
function cbSelectedProp(selectedRowCount, totalRowCountInTable) {
    if (selectedRowCount > 0) {
        showEnableAndDisableBtn();
        if (selectedRowCount == totalRowCountInTable) {
            $("#cbIsSelected").prop("checked", true);
        }
    }
    else {
        hideEnableAndDisableBtn();
        $("#cbIsSelected").prop("checked", false);
    }
}
function cbSelectedClickProp(selectedRowCount) {
    if (selectedRowCount > 0) {
        showEnableAndDisableBtn();
    }
    else {
        hideEnableAndDisableBtn();
    }
}
function DisableUser(selectedItems) {
    let confirmText = "Are you sure you want to disable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " User?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/DisableUser',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected users successfully disabled.");
                            loadData(1);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function EnableUser(selectedItems) {
    let confirmText = "Are you sure you want to enable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " User?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/EnableUser',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected users successfully enabled.");
                            loadData(1);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function DisableAsset(selectedItems) {
    let confirmText = "Are you sure you want to disable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " Asset?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/DisableAsset',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected assets successfully disabled.");
                            loadData(2);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function EnableAsset(selectedItems) {
    let confirmText = "Are you sure you want to enable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " Asset?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/EnableAsset',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected assets successfully enabled.");
                            loadData(2);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function DisableComment(selectedItems) {
    let confirmText = "Are you sure you want to disable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " Comment?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/DisableComment',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected comments successfully disabled.");
                            loadData(4);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function EnableComment(selectedItems) {
    let confirmText = "Are you sure you want to enable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " Comment?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/EnableComment',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected comments successfully enabled.");
                            loadData(4);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function DisablePost(selectedItems) {
    let confirmText = "Are you sure you want to disable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " Post?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/DisablePost',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected posts successfully disabled.");
                            loadData(3);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}
function EnablePost(selectedItems) {
    let confirmText = "Are you sure you want to enable" + ((selectedItems.length > 1) ? " these " + selectedItems.length : " this") + " Post?";

    if (selectedItems.length > 0) {
        if (confirm(confirmText)) {
            $.ajax({
                url: '/AdminMaster/EnablePost',
                method: 'POST',
                data: { selectedIds: selectedItems },
                success: function (res) {
                    if (res) {
                        if (res.message == 'true') {
                            alert("Selected posts successfully enabled.");
                            loadData(3);
                        }
                        else {
                            alert(res.message);
                        }
                    }
                    else {
                        window.location.pathname = '';
                    }
                }
            })
        }
    }
}