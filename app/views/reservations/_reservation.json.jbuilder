json.extract! reservation, :id, :f_name, :l_name, :phone_num, :year, :make, :model, :repair, :date, :user_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
