class CreateInboxs < ActiveRecord::Migration[7.0]
  def change
    create_table :inboxs do |t|
      t.string :email
      t.string :cc
      t.string :bcc
      t.string :subject
      t.string :message
      t.string :attachments

      t.timestamps
    end
  end
end
