class CallBack < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     :with => ((\(\d{3}\) ?)|(\d{3}[-\.]))?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$
  attribute :geo
  attribute :ip
  attribute :message
end
