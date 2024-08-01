require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }
  let(:job_attributes) { attributes_for(:job) }
  let(:applicant) { create(:applicant, user: user) }

  before do
    sign_in user
    applicant
  end

  describe 'GET /jobs' do
    it 'renders the index action' do
      get jobs_path 
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /jobs/new' do
    it 'renders the new action' do
      get new_job_path 
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /jobs' do
    context 'valid attributes' do
      it 'creates a new job' do
        expect {
          post jobs_path, params: { job: job_attributes }
        }.to change(Job, :count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Job successfully posted.')
      end
    end

    context 'invalid attributes' do
      it 'does not create a new job' do
        expect {
          post jobs_path, params: { job: attributes_for(:job, title: nil) }
        }.not_to change(Job, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /jobs/:id/edit' do
    it 'renders the edit action' do
      get edit_job_path(job)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /jobs/:id' do
    context 'valid attributes' do
      it 'updates the job' do
        patch job_path(job), params: { job: { title: 'Software Engineer' } } 
        job.reload
        expect(job.title).to eq('Software Engineer') 
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Job successfully updated.')
      end
    end
  end

  describe 'DELETE /jobs/:id' do
    it 'deletes the job' do
      delete job_path(job)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Job successfully deleted.')
    end
  end

  describe "POST /jobs/:id/apply" do
    context "applicant exists" do
      it "applies to the job" do
        post apply_job_path(job)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Applied to job successfully")
      end
    end

    context "when job is not found" do
      it "renders 404 page" do
        post apply_job_path(id: 1229)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end