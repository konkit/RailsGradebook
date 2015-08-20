require 'csv'

class ReportsController < ApplicationController

  def get_reports
    render json: Report.all
  end

  def generate_report
    @grades = Grade.all

    filename = "grades#{Time.now.to_f}".gsub('.', '_') + ".csv"
    path = "reports/#{filename}"
    report_model = Report.create!(path: path, filename: filename, status: :in_progress, user: current_user )

    GenerateGradesCsvJob.perform_later( report_model.id )

    render json: report_model
  end
end
