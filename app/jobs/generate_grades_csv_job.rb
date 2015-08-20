class GenerateGradesCsvJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    report_model = Report.find(args[0])
    report_model.content = create_csv(report_model)

    report_model.status = :ready
    report_model.save!
  end

  def create_csv(report_model)
    CSV.generate do |csv|
      csv << ['id', 'gradevalue', 'subjectname', 'createddate']
      Grade.get_grades_for_report(report_model.user).each do |grade|
        csv << [grade.id, grade.gradevalue, grade.subject.name, grade.created_at.to_s]
      end
    end
  end
end
