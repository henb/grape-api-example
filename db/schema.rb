ActiveRecord::Schema.define(version: 20_140_719_051_247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'posts', force: true do |t|
    t.string 'title'
    t.string 'description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

end
