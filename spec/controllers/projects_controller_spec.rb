require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "assigns @projects" do
      get :index
      expect(assigns(:projects)).to include(project)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns @project" do
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    it "creates a new project" do
      expect {
        post :create, params: { project: { name: "New Project", status: "pending" } }
      }.to change(Project, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the project" do
      patch :update, params: { id: project.id, project: { name: "Updated Name" } }
      project.reload
      expect(project.name).to eq("Updated Name")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the project" do
      expect {
        delete :destroy, params: { id: project.id }
      }.to change(Project, :count).by(-1)
    end
  end
end
