// Injects new user email in user search field when modal closes
export default class {
    constructor(userField) {
        this.handleInvitationSuccess(userField)
    }
    handleInvitationSuccess(userField) {
        $('#ajax-modal').on('hidden.bs.modal', function () {
            // Pick new user email from content loaded by the modal
            var newUserEmail = $(this).find(".new-user-email").text();
            // If user email is not blanck, inject it in user search.
            if (null == newUserEmail.match(/^\s*$/)) {
                userField.val(newUserEmail).trigger('change');
            }
        })
    }
}