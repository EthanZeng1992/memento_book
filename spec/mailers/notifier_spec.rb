require 'spec_helper'

describe Notifier do
  describe "password_reset_instructions" do
    let(:user) { FactoryGirl.create(:user, :email => "forgot_my_password@example.com") }
    let(:mail) { Notifier.password_reset_instructions(user) }

    before(:each) do
      expect(user).to receive(:perishable_token).and_return("62fe5299b45513f9d22a2e1454f35dd43d62ba50")
    end

    it "sets memento-book as the sender" do
      expect(mail.from).to eql(["ethanzeng1992@gmail.com"])
    end

    it "sets user 'forgot_my_password@example.com' as recipient" do
      expect(mail.to).to eq(["forgot_my_password@example.com"])
    end

    it "sets the subject" do
      expect(mail.subject).to eq("Memento-Book: Password Reset Instructions")
    end

    it "includes password reset link in body" do
      expect(mail.body.encoded).to match("http://localhost:3000/passwords/62fe5299b45513f9d22a2e1454f35dd43d62ba50/edit")
    end
  end
end
