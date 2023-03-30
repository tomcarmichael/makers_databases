require 'cohort_repository'

describe CohortRepository do
  it "finds cohort and its students by cohort id" do
    cohort_repo = CohortRepository.new
    cohort_found = cohort_repo.find_with_students(2)
    expect(cohort_found.students.length).to eq 3
    expect(cohort_found.students.first.name).to eq 'Harry'
    expect(cohort_found.students.first.id).to eq 5
  end
end