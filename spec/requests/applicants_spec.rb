require 'rails_helper'

RSpec.describe "Applicants", type: :request do
  let(:user) { create(:user) } 
  let(:applicant) { create(:applicant, user: user) }
  let(:job) { create(:job) }
  let(:applicant_attributes) {
    {
      name: 'Hassan Murtaza',
      email: 'hassan@gmail.com',
      cnic: '12345-1234567-1',
      linkedin_profile: 'https://www.linkedin.com/in/hassan-murtaza',
      resume: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test_resume.pdf'), 'application/pdf')
    }
  }

  before do
    sign_in user
  end

  describe "GET /index" do
    context "job exists" do
      it "renders the index action" do
        get job_applicants_path(job_id: job.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context "when job is not found" do
      it "renders 404 page" do
        get job_applicants_path(job_id: 1229)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET /applicants/new' do
    it 'renders the new action' do
      get new_applicant_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /applicants" do
    context "valid attributes" do
      it "creates a new applicant" do
        expect {
          post applicants_path, params: { applicant: applicant_attributes }
        }.to change(Applicant, :count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Applicant data was successfully created.")
      end
    end

    context "invalid attributes" do
      it "does not create a new applicant" do
        invalid_attributes = applicant_attributes.merge(cnic: nil)
        expect {
          post applicants_path, params: { applicant: invalid_attributes }
        }.not_to change(Applicant, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /applicants/:id/edit' do
    it 'renders the edit action' do
      get edit_applicant_path(applicant)
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'PATCH /applicants/:id' do
    context 'valid attributes' do
      it 'updates the applicant' do
        patch applicant_path(applicant), params: { applicant: { name: 'Hassan Malik' } }
        applicant.reload
        expect(applicant.name).to eq('Hassan Malik')
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Applicant data was successfully updated.')
      end
    end

    context 'invalid attributes' do
      it 'does not update the applicant' do
        patch applicant_path(applicant), params: { applicant: { email: nil } }
        applicant.reload
        expect(applicant.email).not_to be_nil
      end
    end
  end
end
