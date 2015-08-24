require 'csv'

class ReportsController < ApplicationController

  def get_reports
    authorize! :get_reports, current_user
    render json: Report.where(user: current_user)
  end

  def view_report
    report = Report.find_by(filename: params[:filename])
    authorize! :view_reports, report
    render text: report.content, content_type: 'text/csv'
  end

  def generate_report
    authorize! :generate_reports, current_user
    filename = "grades#{Time.now.to_f}".gsub('.', '_')
    report_model = Report.create!(filename: filename, status: :in_progress, user: current_user )

    GenerateGradesCsvJob.perform_later( report_model.id )

    render json: report_model
  end
end
