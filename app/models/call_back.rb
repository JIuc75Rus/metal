class CallBack < MailForm::Base
  attribute :name,      :validate => true
  attribute :phone,     :validate => /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i
  attribute :message
  attribute :times
end
