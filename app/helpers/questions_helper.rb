 module QuestionsHelper

  def fix_datetime(rawdate)
    ar_time = rawdate.to_s
    DateTime.parse(ar_time).strftime("%a, %b %e at %l:%M %p")
  end

end