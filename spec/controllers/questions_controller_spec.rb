# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionsController, :controller do
  describe 'GET #index' do
    it 'return a success response and renders the index template' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns a success response and redirect' do
      question = create(:question)
      get :show, params: { id: question.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'render the template :new' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new question with valid attributes and redirect' do
      expect do
        post :create, params: { question: attributes_for(:question) }
      end.to change(Question, :count).by(1)
      expect(response).to redirect_to(questions_path)
    end

    it 'does not create a question with invalid attributes and render :new' do
      expect do
        post :create, params: { question: { title: '', body: '' } }
      end.not_to change(Question, :count)
      expect(response).to render_template(:new)
    end
  end

  describe 'EDIT #edit' do
    let(:question) { create(:question) }

    it 'render the template :edit' do
      get :edit, params: { id: question.id }
      expect(response).to be_successful
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:question) { create(:question) }

    context 'with valid parameters' do
      it 'updated with valid parameters and redirect' do
        patch :update, params: { id: question.id, question: { title: 'New title', body: 'New body' } }
        question.reload
        expect(question.title).to eq('New title')
        expect(question.body).to eq('New body')
        expect(response).to redirect_to(questions_path)
      end
    end

    context 'with invalide parameters' do
      it 'update with invalid parameters and render :edit' do
        patch :update, params: { id: question.id, question: { title: '', body: '' } }
        question.reload
        expect(question.title).not_to eq('')
        expect(question.body).not_to eq('')
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'delete the question and redirect' do
      question = create(:question)
      expect do
        delete :destroy, params: { id: question.id }
      end.to change(Question, :count).by(-1)
      expect(response).to redirect_to(questions_path)
    end
  end
end
