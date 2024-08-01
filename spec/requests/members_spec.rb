require 'rails_helper'

RSpec.describe "Members", type: :request do
  let(:admin) { create(:user, user_type: :admin) }
  let(:employer) { create(:user, user_type: :employer) }
  let(:job_seeker) { create(:user, user_type: :job_seeker) }
  let(:new_employer_attributes) { attributes_for(:user, user_type: :employer) }

  before do
    sign_in admin
  end

  describe "GET /index" do
    it "returns all employers" do
      get members_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /new" do
    it "renders the new action" do
      get new_member_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "valid attributes" do
      it "creates a new employer" do
        expect {
          post members_path, params: { user: new_employer_attributes }
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Employer registered successfully. A password has been sent to the employer's email.")
      end
    end

    context "invalid attributes" do
      it "does not create a new employer" do
        invalid_attributes = new_employer_attributes.merge(email: nil)
        expect {
          post members_path, params: { user: invalid_attributes }
        }.not_to change(User, :count)

        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /home" do
    context "user is a job seeker" do
      before { sign_in job_seeker }

      it "renders the job_seeker partial" do
        get root_path
        expect(response).to render_template(partial: '_job_seeker')
      end
    end

    context "user is an admin" do
      before { sign_in admin }

      it "renders the admin parial" do
        get root_path
        expect(response).to render_template(partial: '_admin')
      end
    end

    context "user is an employer" do
      before { sign_in employer }

      it "renders the employer partial" do
        get root_path
        expect(response).to render_template(partial: '_employer')
      end
    end
  end
end
