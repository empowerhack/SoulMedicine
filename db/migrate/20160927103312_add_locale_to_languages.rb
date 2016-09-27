class AddLocaleToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :locale, :string, :limit => 2
  end
end
