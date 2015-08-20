class GenerateGradesCsvJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    report_model = Report.find(args[0])
    path = report_model.path

    sleep(10.0);

    CSV.open( "#{Rails.root}/public/" + path, "w" ) do |csv|
      csv << ['id', 'gradevalue', 'subjectname', 'createddate']
      Grade.all.each do |grade|
        csv << [grade.id, grade.gradevalue, grade.subject.name, grade.created_at.to_s]
      end
    end

    report_model.status = :ready
    report_model.save!
  end
end
