class MenuComment < ApplicationRecord
    belongs_to :user
    belongs_to :menu
    
    validates :comment, presence: true
end
