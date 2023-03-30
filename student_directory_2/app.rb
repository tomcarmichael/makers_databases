require_relative './lib/cohort_repository'
require_relative './lib/cohort'
require_relative './lib/student'
require_relative './lib/database_connection'

DatabaseConnection.connect('student_directory_2')

cohort_repo = CohortRepository.new
cohort = cohort_repo.find_with_students(1)

puts "Found #{cohort.name} cohort. They started Makers on #{cohort.start_date}."
puts "Students:"
cohort.students.each do |student|
  puts "#{student.name}"
end