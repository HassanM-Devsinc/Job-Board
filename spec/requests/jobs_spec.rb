require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }
  let(:job_attributes) { attributes_for(:job) }
  let(:applicant) { create(:applicant, user: user) }

  before do
    sign_in user
  end

  describe 'GET /jobs' do
    it 'lists all jobs' do
      job
      get jobs_path 
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /jobs/new' do
    it 'renders new job form' do
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
      end
    end
  end

  describe 'GET /jobs/:id/edit' do
    it 'renders the edit job form' do
      get edit_job_path(job)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Edit Job')
    end
  end

  describe 'PUT /jobs/:id' do
    context 'with valid attributes' do
      it 'updates the job' do
        put job_path(job), params: { job: { title: 'Updated Title' } } 
        job.reload
        expect(job.title).to eq('Updated Title') 
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Job successfully updated.')
      end
    end

    context 'with invalid attributes' do
      it 'does not update the job' do
        put job_path(job), params: { job: { title: nil } } 
        job.reload
        expect(job.title).not_to be_nil
      end
    end
  end

  describe 'DELETE /jobs/:id' do
    it 'deletes the job' do
      job 
      expect {
        delete job_path(job)
      }.to change(Job, :count).by(-1)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Job successfully deleted.')
    end
  end
end
