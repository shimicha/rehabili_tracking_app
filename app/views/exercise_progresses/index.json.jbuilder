  json.array!(@exercise_progresses) do |exercise_progresse|
  json.extract! exercise_progresse, :id, :progresse_keep
  json.start Time.zone.parse("#{exercise_progresse.date}")
  #json.end exercise_progresse.date
  #json.url exercise_progresse_url(exercise_progresse, format: :html)
  json.title exercise_progresse.date
  puts exercise_progresse.date
end