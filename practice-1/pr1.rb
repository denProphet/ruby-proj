def main
$items = ['rock', 'scissors', 'paper']

opponent_choice = rand(3)
user_choice = get_item_choice_from_user

show_selected_items(user_choice, opponent_choice)
puts(get_result(user_choice, opponent_choice))
end

## Метод, который возвращает данные пользователя с консоли

def get_item_choice_from_user
puts 'There are some options: 0 - rock, 1 - scissors, 2 - paper'
return gets.chomp().to_i
end

## Метод с основной бизнес-логикой.
## Результат игры в зависимости от выбора

def get_result(user_choice, opponent_choice )
  if user_choice == opponent_choice
    return 'draw'


    # rock (u) vs scissors (opponent)
  elsif user_choice == 0 && opponent_choice == 1
    return 'You win'

    # paper (u) vs rock (opponent)
  elsif user_choice == 2 && opponent_choice == 0
    return 'You win'

    # scissors (u) vs paper (opponent)
  elsif user_choice == 1 && opponent_choice == 2
    return 'You win'

  else
    return 'You lose'
  end
end


## Метод, который печатает, что именно было выбрано

def show_selected_items(user_choice, opponent_choice)
  puts ("Your item: " + $items[user_choice])
  puts ("Opponent`s item: " + $items[opponent_choice])
end

## Main


main
