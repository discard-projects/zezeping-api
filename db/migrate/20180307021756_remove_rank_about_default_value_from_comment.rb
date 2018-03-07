class RemoveRankAboutDefaultValueFromComment < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:comments, :rank_taste, nil)
    change_column_default(:comments, :rank_env, nil)
    change_column_default(:comments, :rank_service, nil)
  end
end
