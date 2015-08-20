require 'rails_helper'

RSpec.describe GenerateGradesCsvJob, type: :job do
  let(:report) do
    FactoryGirl.create(:report, user: FactoryGirl.create(:teacher) )
  end

  let(:args) do
    report.id
  end

  let(:job) do
    GenerateGradesCsvJob.new
  end

  describe "peform" do
    before(:each) do
      allow(job).to receive(:create_csv_file).and_return(true)
      allow(job).to receive(:perform).and_call_original
    end

    it "should call create_csv_file with path as parameter" do
      expect(job).to receive(:create_csv_file).with(report)
      job.perform(report.id)
    end

    it "should find Report with id given as arg" do
      expect(Report).to receive(:find).with(report.id).and_return(report)
      job.perform(report.id)
    end

    it "should save report_model set as ready" do
      report.status = :in_progress
      allow(Report).to receive(:find).with(report.id).and_return(report)
      expect(report).to receive(:save!)
      job.perform(report.id)
      expect(report.status).to eq("ready")
    end
  end
end
