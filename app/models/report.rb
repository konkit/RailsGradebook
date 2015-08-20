class Report < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :status, :user

    enum status: [ :in_progress, :ready ]
end
