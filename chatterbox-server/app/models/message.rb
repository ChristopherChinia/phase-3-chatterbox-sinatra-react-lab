class Message < ActiveRecord::Base
def self.created_at
    self.all.order(created_at: :asc)
end
end