GuestUsers = {
    initialize: function () {
        var GuestUserInvitations = require('guest_users/invitations');
        // Respectively :
        // - collections edition sharing tab
        // - work edition sharing tab
        // - fil edition sharing tab
        var userFieldsContainersIds = ["form#user-participants-form",
            "fieldset.permission-add-user", "div#new-user"];
        $.each(userFieldsContainersIds, function (index, value) {
            var select2Field = $(value).find(".select2-container");
            if (select2Field.length > 0) {
                new GuestUserInvitations(select2Field.next('input'));
            }
        });
    },
}
