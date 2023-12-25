  json.array!(@exercise_progresses) do |exercise_progresse|
  json.extract! exercise_progresse, :id, :progresse_keep
  json.start Time.zone.parse("#{exercise_progresse.date}")
  #json.end exercise_progresse.date
  json.url exercise_progress_path(exercise_progresse)
  json.title "実施済"
  puts exercise_progresse.date
end