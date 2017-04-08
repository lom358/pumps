# Если в системе нет пользователей - создаем
puts 'Seed start'
if  User.count == 0
  u = User.new
  u.email='admin@mail.ru'
  u.login='login'
  u.password='qwerty123456'
  p u.save ? 'User created ' : 'User don\'t created'
end


# Создание типов перегоняемого материала, в случае его отсутствия в системе
if  TypeMaterial.count == 0
  data_array = [[1, "вода"], [2, "Воздух"]]
  data_array.each  do |data|
    tm = TypeMaterial.new
    tm.code=data[0]
    tm.name=data[1]
    p tm.save ? "TypeMaterial #{tm.code} #{tm.name} created!" : 'TypeMaterial don\'t created'
  end
end

puts 'Seed end'


