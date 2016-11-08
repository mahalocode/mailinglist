# frozen_string_literal: true
class Visitor < ApplicationRecord
  validates_presence_of :email
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  after_create :subscribe
  after_initialize :defaults

  def defaults
    self.affinity = 'NONE' unless affinity == 'KITTENS'
  end

  def subscribe
    MailingListSignupJob.perform_later(self)
  end
end
