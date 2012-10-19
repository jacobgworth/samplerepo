class ChangeBodyToTextNoLimit < ActiveRecord::Migration
   # careful, it's "nil", not "null"
  change_column :updates, :body, :text, :limit => nil
end
