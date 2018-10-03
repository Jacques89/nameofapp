module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
    end

    def disconnect
    end
  end
end
