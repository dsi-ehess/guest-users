Rails.application.routes.draw do
  mount GuestUsers::Engine => "/guest_users"
end
