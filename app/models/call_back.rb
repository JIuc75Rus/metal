class CallBack < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     :validate => /\A([\w\.%\+\-]+)([\w\-]+\.)+([\w]{2,})\z/i
  validates_length_of   :phone, :minimum => 11, :maximum => 11
  attribute :geo
  attribute :ip
  attribute :message
end
