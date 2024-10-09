# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing to questions', :routing do
  context 'when routes pages' do
    it 'routes / to pages#index' do
      expect(get: '/').to route_to('pages#index')
    end
  end

  context 'when routes questions' do
    it 'routes /questions to questions#index' do
      expect(get: '/questions').to route_to('questions#index')
    end

    it 'routes /questions/:id to questions#show' do
      expect(get: '/questions/1').to route_to('questions#show', id: '1')
    end

    it 'routes /questions/new to questions#new' do
      expect(get: '/questions/new').to route_to('questions#new')
    end

    it 'routes /questions to questions#create' do
      expect(post: '/questions').to route_to('questions#create')
    end

    it 'routes /questions/:id/edit to questions#edit' do
      expect(get: '/questions/1/edit').to route_to('questions#edit', id: '1')
    end

    it 'routes /questions/:id to questions#update' do
      expect(patch: '/questions/1').to route_to('questions#update', id: '1')
    end

    it 'routes /questions/:id to questions#destroy' do
      expect(delete: 'questions/1').to route_to('questions#destroy', id: '1')
    end
  end
end
