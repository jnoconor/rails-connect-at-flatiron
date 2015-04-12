module StudentsHelper
  def student_name
    @student.full_name ? @student.full_name : "New Student"
  end

  def delete_link(student)
    link_to(raw('<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>'), cohort_student_path(student.cohort, student), :method => :delete)
  end
end
