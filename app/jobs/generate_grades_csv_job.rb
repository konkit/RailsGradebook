class GenerateGradesCsvJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    report_model = Report.find(args[0])

    sleep(5.0);

    create_csv_file(report_model)

    report_model.status = :ready
    report_model.save!
  end

  def create_csv_file(report_model)
    CSV.open( "#{Rails.root}/public/" + report_model.path, "w" ) do |csv|
      csv << ['id', 'gradevalue', 'subjectname', 'createddate']
      Grade.get_grades_for_report(report_model.user).each do |grade|
        csv << [grade.id, grade.gradevalue, grade.subject.name, grade.created_at.to_s]
      end
    end
  end
end
