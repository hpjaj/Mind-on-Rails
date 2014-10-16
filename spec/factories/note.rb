FactoryGirl.define do
  factory :note do
    title "This is a note"
    body "This is the body of a new note"
    stack_ids [1]
    public true
    user
  end
end