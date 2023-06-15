class ComposeSerializer < ActiveModel::Serializer
  attributes :id, :email, :cc, :bcc, :subject, :message, :attachments, :created_at
end
