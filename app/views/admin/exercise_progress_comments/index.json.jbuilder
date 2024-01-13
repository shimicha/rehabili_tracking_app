json.array!(@exercise_progresses) do |exercise_progress|
  json.extract! exercise_progress, :id, :progresse_keep
  json.start Time.zone.parse("#{exercise_progress.date}")
  #json.end exercise_progress.date
  json.url new_admin_exercise_progress_comment_path(
    exercise_progress_id: exercise_progress.id,
    user_id: exercise_progress.user_id,
    date: exercise_progress.date
    )
  json.title "実施済"
  puts exercise_progress.date
end

