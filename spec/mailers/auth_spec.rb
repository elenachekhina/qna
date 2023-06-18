require 'rails_helper'

RSpec.describe AuthMailer, type: :mailer do
  describe 'Confirm email' do
    let(:user) { FactoryBot.create(:user, confirmation_token: '123') }
    let(:mail) { AuthMailer.with(user: user).confirm_email }

    it 'queues the email' do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'renders the header' do
      expect(mail.subject).to eq('Email confirmation')
      expect(mail.to).to eq([user.email])
    end

    it 'renders the body' do
      expect(mail.body).to have_link('Confirm Email')
    end
  end
end
