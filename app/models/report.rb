class Report < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :path, :status, :user

    enum status: [ :in_progress, :ready ]
end
