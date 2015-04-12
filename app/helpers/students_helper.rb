module StudentsHelper
  def student_name
    @student.full_name ? @student.full_name : "New Student"
  end

  def delete_link(student)
    link_to(raw('<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>'), cohort_student_path(student.cohort, student), :method => :delete)
  end

  def follow_status(student, new_friends, old_friends)
    if new_friends && new_friends.include?(student.twitter_handle)
      raw('<td class="green">Followed!</td>')
    elsif old_friends.include?(student.twitter_handle)
      raw('<td>Following</td>')
    else
      raw('<td></td>')
    end
  end
end
