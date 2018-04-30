module GuestUsers
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
