class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      
      t.string :slug
      t.index :slug, unique: true, using: :btree
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      t.string :name
      t.boolean :gender
      t.date :dob
      t.string :about
      t.string :occupation
      t.string :ethnicity
     
      
      
      t.text :hobbies
      t.text :interests
      t.string :youtube
      t.string :twitter
      t.string :facebook
      t.string :instagram


      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      
      t.attachment :image  
      
      
      # image_file_name # The original filename of the image.
      # image_content_type # The mime type of the image.
      # image_file_size # The file size of the image.
      # image_updated_at # The last updated date of the image.


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
