require 'rails_helper'


RSpec.describe TestingWorker, type: :worker do
    let!(:employee) {FactoryBot.create(:employee)}
    it 'should not return any error' do
      expect{TestingWorker.perform_async(employee.first_name)}.not_to raise_error
    end
  end