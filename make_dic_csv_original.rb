require 'csv'

CSV.open("custom3.csv", 'w') do |csv|
  title_length = "練馬土支田店".length
  score = [-36000.0, -400 * (title_length ** 1.5)].max.to_i
  csv << ['練馬土支田店', nil, nil, score, '名詞', '固有名詞', '地域', '一般', '*', '*', '練馬土支田店', '*', '*', 'seven-tenpo']
  
  title_length = "ラーメン".length
  score = [-36000.0, -400 * (title_length ** 1.5)].max.to_i
  csv << ['ラーメン', nil, nil, score, '名詞', '固有名詞', '一般', '*', '*', '*', 'ラーメン', '*', '*', 'meal']
  
  title_length = "レジ打ち".length
  score = [-36000.0, -400 * (title_length ** 1.5)].max.to_i
  csv << ['レジ打ち', nil, nil, score, '名詞', '固有名詞', '一般', '*', '*', '*', 'レジ打ち', '*', '*', 'seven-job']
end
