  json.array!(@exercise_progresses) do |exercise_progress|
  json.extract! exercise_progress, :id, :progresse_keep
  json.start Time.zone.parse("#{exercise_progress.date}")
  #json.end exercise_progress.date
  json.url exercise_progress_path(exercise_progress)
  json.title "実施済"
  puts exercise_progress.date
end