# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(TasksController, type: :controller) do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      create(:task)
      get :index, params: {}
      expect(Task.count).to(eq(1))
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      task = create(:task, user_id: @user.id)
      get :show, params: { id: task.id }
      expect(response).to(be_successful)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to(be_successful)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      task = create(:task, user_id: @user.id)
      get :edit, params: { id: task.id }
      expect(response).to(be_successful)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect do
          task = attributes_for(:task, user_id: @user.id)
          post :create, params: { task: task }
        end.to(change(Task, :count).by(1))
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested task' do
        task = create(:task, user_id: @user.id)
        put :update, params: { id: task.id, task: attributes_for(:task, user_id: @user.id) }
        task.reload
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys (soft delete) the requested task' do
      task = create(:task, user_id: @user.id)
      expect do
        delete :destroy, params: { id: task.id }
      end.to(change(Task, :count).by(0))
    end

    it 'redirects to the tasks list' do
      task = create(:task, user_id: @user.id)
      delete :destroy, params: { id: task.id }
      expect(response).to(redirect_to(tasks_url))
    end
  end
end
