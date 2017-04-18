class Session < ApplicationRecord
  acts_as_voter
  # request.remote_ip
end
