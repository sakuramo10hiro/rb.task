require "csv"
#csvの読み込み、csv.openコードが使用できる

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
input_type = gets.to_i
#キーボードから入力された値を数値で返すメソッド
#gets.to_sなら文字列で

if input_type == 1
 puts "拡張子を除いたファイル名を入力して下さい。"
 file_name = gets.chomp
 #文字列の末尾から改行コードを取り除いた文字列を返す
 puts "メモの内容を記入して下さい。"
 puts "入力が完了したらCtrl + Dで保存します。"
 memo = STDIN.read
 #複数行を文字列として取得
 CSV.open("#{file_name}.csv","w") do |csv|
 #csvファイルの書き込み、読み込み用のメソッド(wの部分で書き込みの命令)
 #(aだった場合は追記モードで既存データに書き込みがされる↓)
 csv << [memo]
 #memoの内容をcsvに書き込み 
  end

 elsif input_type == 2
  puts "メモを編集する"
  file_name = gets.chomp

  puts "入力が完了したらCtrl + Dで保存します。"
  memo = STDIN.read
  CSV.open("#{file_name}.csv","a") do |csv|
  csv << [memo]
  end

 else
  puts "1か2を入力して下さい。"
 end
end