class Activity < ActiveRecord::Base
    has_many :messages
    has_many :invites
    has_many :users, through: :invites
end
