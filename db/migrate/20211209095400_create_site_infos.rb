class CreateSiteInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :site_infos do |t|
      t.string :ip_add
      t.string :student_no
      t.string :path
      t.timestamps
    end
  end
end
