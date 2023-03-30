require_relative './database_connection.rb'
require_relative './cohort.rb'
require_relative './student.rb'

class CohortRepository
  def find_with_students(id)
    sql = 'SELECT cohorts.name AS "cohort", 
                  start_date, 
                  students.name AS "student", 
                  cohorts.id AS "cohort_id",
                  students.id AS "student_id"
                      FROM cohorts JOIN students
                      ON cohorts.id = students.cohort_id
                          WHERE cohorts.id = $1;'
                          
    result_set = DatabaseConnection.exec_params(sql, [id])

    cohort = Cohort.new

    # Inflating from the first row of results, but data would be equivalent for any given row
    cohort.id = result_set[0]['cohort_id'].to_i
    cohort.name = result_set[0]['cohort']
    cohort.start_date = result_set[0]['start_date']

    result_set.each do |row|
      student = Student.new
      student.id = row['student_id'].to_i
      student.name = row['student']
      student.cohort_id = row['cohort_id'].to_i
      cohort.students << student
    end

    return cohort
  end
end