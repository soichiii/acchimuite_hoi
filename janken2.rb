 require "csv" 
 puts"------------------------------"
 puts"あっち向いてホイゲームを始めます。"
 
def janken
 puts "じゃんけん・・・" 
 puts "0(グー)1(チョキ)2(パー)3(戦わない)"
 my_hand = gets.to_i
 pc_hand = rand(3)
 
 jankens = ["グー","チョキ","パー","戦わない"]
  puts "あなたの手:#{jankens[my_hand]}\n相手の手:#{jankens[pc_hand]}"
  puts"------------------------------"

  win = (my_hand == 0 && pc_hand == 1) || (my_hand == 1 && pc_hand == 2) || (my_hand == 2 && pc_hand == 0)
  lose = (my_hand == 0 && pc_hand == 2) || (my_hand == 1 && pc_hand == 0) || (my_hand == 2 && pc_hand == 1)
  draw = my_hand == pc_hand
  fin = my_hand == 3

 if fin
   puts"じゃんけんが放棄されました。ゲームを終了します。"
   @janken_judge = "fin"
   exit
   
 end
 
 if draw
    puts "あいこです。もう一度じゃんけんをします。"
    @janken_judge = "draw"
    janken  
    sreturn true
    
 elsif lose
    puts"じゃんけんに負けました。あっちむいて・・・"
    @janken_judge = "lose"
    acchimuite_hoi
    
 elsif win
    puts "じゃんけんに勝ちました。あっちむいて・・・"
    @janken_judge = "win"
    acchimuite_hoi
 end
end

def acchimuite_hoi
 puts "0(上)1(下)2(左)3(右)"
 select_number = gets.to_i
 random_number =rand(3)
 directions = ["上","下","左","右"]
 puts"ホイ！"
 puts "あなた：#{directions[select_number]} 相手：#{directions[random_number]}"
 puts"------------------------------"

 if @janken_judge == "win" && select_number == random_number
  puts "勝ちました!"
  exit
  
 elsif @janken_judge == "lose" && select_number == random_number
   puts "負けました..." 
   exit
  
 else
   puts "もう一度じゃんけんします"
  janken
  return
 end
end

next_game = true

while next_game
  next_game = janken
  
end


