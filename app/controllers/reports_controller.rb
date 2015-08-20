require 'csv'

class ReportsController < ApplicationController

  def get_reports
    render json: Report.all
  end

  def view_report
    render text: Report.find_by(filename: params[:filename]).content, content_type: 'text/csv'
  end

  def generate_report
    filename = "grades#{Time.now.to_f}".gsub('.', '_')
    report_model = Report.create!(filename: filename, status: :in_progress, user: current_user )

    GenerateGradesCsvJob.perform_later( report_model.id )

    render json: report_model
  end
end
