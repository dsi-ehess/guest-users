Flipflop.configure do
  feature :guest_users,
          default: false,
          description: I18n.t("guest_users.feature_description")
end
