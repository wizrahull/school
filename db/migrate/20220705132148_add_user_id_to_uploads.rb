class AddUserIdToUploads < ActiveRecord::Migration[7.0]
  def change
    # add_reference :uploads, :user_id, null: false, forei/gn_key: true
  end
end
