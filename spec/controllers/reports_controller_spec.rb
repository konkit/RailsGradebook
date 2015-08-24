require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  #render_views
  #let(:json) { JSON.parse(response.body) }
  let!(:teacher) { FactoryGirl.create(:teacher) }
  before(:each) do
    expect(controller).to receive(:current_user).at_least(:once).and_return(teacher)
  end

  describe "get_reports" do
    let!(:reports) { FactoryGirl.create_list(:report, 3, user: teacher )}
    let!(:unowned_report) { FactoryGirl.create(:report, user: FactoryGirl.create(:teacher, email: Faker::Internet.email) )}

    it "should return proper JSON with all reports" do
      get :get_reports, :format => :json
      expect(response.body).to be_json_eql(reports.to_json).in_any_order
    end
  end

  describe "view_report" do
    let!(:report) { FactoryGirl.create(:report, filename: 'FilenameAsdf', content: 'asdf', user: teacher ) }
    let!(:unowned_report) { FactoryGirl.create(:report, filename: 'Aaa', user: FactoryGirl.create(:teacher, email: Faker::Internet.email) )}

    it "should return proper JSON with desired report" do
      get :view_report, :format => :json, :filename => 'FilenameAsdf'
      expect(response.body).to eq(report.content)
    end
  end

  describe "generate_report" do
    let!(:current_report_count) { Report.count }

    before(:each) do
      expect(GenerateGradesCsvJob).to receive(:perform_later).and_return(true)

      get :generate_report, :format => :json
    end

    it "should change the count of reports" do
      expect(Report.count).to eq(current_report_count + 1)
    end

    it "should create report with status as in_progress" do
      expect(Report.last.in_progress?).to eq(true)
    end

    it "should create report with current_user as user" do
      expect(Report.last.user).to eq(teacher)
    end

    it "should render report_model as json" do
      expect(response.body).to be_json_eql(Report.last.to_json)
    end
  end

end
