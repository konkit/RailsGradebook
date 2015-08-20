require 'csv'

class ReportsController < ApplicationController

  def get_reports
    render json: Report.all
  end

  def generate_report
    @grades = Grade.all

    sleep(3.0);

    filename = "grades#{Time.now.to_f}".gsub('.', '_') + ".csv"
    path = "reports/#{filename}"
    reportModel = Report.create!(path: path, filename: filename, status: :in_progress )

    CSV.open( "#{Rails.root}/public/" + path, "w" ) do |csv|
      csv << ['id', 'gradevalue', 'subjectname', 'createddate']
      Grade.all.each do |grade|
        csv << [grade.id, grade.gradevalue, grade.subject.name, grade.created_at.to_s]
      end
    end

    reportModel.status = :ready
    reportModel.save!

    render text: path
  end

end
