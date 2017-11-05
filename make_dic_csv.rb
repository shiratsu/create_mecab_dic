require 'csv'

original_data = {
  wikipedia: 'jawiki-latest-all-titles-in-ns0',
  hatena: 'keywordlist_furigana.csv'
}

CSV.open("custom2.csv", 'w') do |csv|
  original_data.each do |type, filename|
    next unless File.file? filename
    open(filename).each do |title|
      title.strip!

      next if title =~ %r(^[+-.$()?*/&%!"'_,]+)
      next if title =~ /^[-.0-9]+$/
      next if title =~ /曖昧さ回避/
      next if title =~ /_\(/
      next if title =~ /^PJ:/
      next if title =~ /の登場人物/
      next if title =~ /一覧/

      title_length = title.length

      if title_length > 3
        score = [-36000.0, -400 * (title_length ** 1.5)].max.to_i
        csv << [title, nil, nil, score, '名詞', '一般', '*', '*', '*', '*', title, '*', '*', type]
      end
    end
  end
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
