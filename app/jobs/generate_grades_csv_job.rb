class GenerateGradesCsvJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    report_model = Report.find(args[0])
    path = report_model.path

    sleep(5.0);

    create_csv_file(path)

    report_model.status = :ready
    report_model.save!
  end

  def create_csv_file(path)
    CSV.open( "#{Rails.root}/public/" + path, "w" ) do |csv|
      csv << ['id', 'gradevalue', 'subjectname', 'createddate']
      Grade.all.each do |grade|
        csv << [grade.id, grade.gradevalue, grade.subject.name, grade.created_at.to_s]
      end
    end
  end
end
