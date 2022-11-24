require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
 
# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

# 新規作成の場合
if memo_type == 1
  
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  
  puts "メモしたい内容を入力してください"
  puts "記入が終わったらctrl+Dを押してください"
  input = $stdin.read.split("\n")
  
  #受け取った内容でcsvファイルを上書き保存する
  csv = CSV.open("#{file_name}.csv", "w")
    csv.puts input
  csv.close
  
# 既存ファイルの編集（追記）の場合
elsif memo_type == 2
  
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  
  # 指定したファイルが存在する場合
  if File.exist?("#{file_name}.csv")
    
    # 現在のファイル内容を出力
    puts "現在のメモ内容は以下です"
    puts "--------------------------"
    puts CSV.read("#{file_name}.csv")
    puts "--------------------------"
    
    puts "追記したい内容を入力してください"
    puts "記入が終わったらctrl+Dを押してください"
    input = $stdin.read.split("\n")
    
    #受け取った内容をcsvファイルに追記する
    csv = CSV.open("#{file_name}.csv", "a")
      csv.puts input
    csv.close
    
  # 指定したファイルが存在しない場合
  else
    
    puts "該当ファイルが存在しませんでした"
    
  end
  
# 最初に1と2以外が選択された場合
else
  
  puts "1か2を選択してください"
  
end

puts "処理を終了します"