class Staff < ApplicationRecord
    #importメソッド
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
        # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
        staff = find_by(id: row["id"]) || new
        # CSVからデータを取得し、設定する
        staff.attributes = row.to_hash.slice(*updatable_attributes)
        staff.save
        end
    end
    
    # 更新を許可するカラムを定義
    def self.updatable_attributes
        ["staff_id", "group", "info"]
    end
end
