class CallBack < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     :validate => /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i,
                        :numericality => true,
                        :length => { :minimum => 10, :maximum => 15 }
  attribute :geo
  attribute :ip
  attribute :message
end
