class CallBack < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     :presence => {:message => 'hello world, bad operation!'},
                        :numericality => true,
                        :length => { :minimum => 10, :maximum => 15 }
  attribute :geo
  attribute :ip
  attribute :message
end
