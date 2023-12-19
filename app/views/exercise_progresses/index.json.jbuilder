json.array!(@exercise_progresses) do |exercise_progresse|
  json.extract! exercise_progresse, :id, :tag, :progresse_keep
  json.start exercise_progresse.date
  json.end exercise_progresse.date
  json.url exercise_progresse_url(exercise_progresse, format: :html)
end