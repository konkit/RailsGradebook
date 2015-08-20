class Report < ActiveRecord::Base
    validates_presence_of :path, :status

    enum status: [ :in_progress, :ready ]
end
