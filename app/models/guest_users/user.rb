module GuestUsers
  class User < ::User
    enum user_status: {member: 0, guest: 1}

    has_many :guests, inverse_of: :host
    belongs_to :host, class_name: 'User', foreign_key: 'host_id', optional: true
  end
end
