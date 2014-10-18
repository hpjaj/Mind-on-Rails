FactoryGirl.define do
  factory :note do
    title "This is a note"
    body "This is the body of a new note"
    stack_ids [1]
    private false
    user


    factory :note_with_stack do
      stack_ids nil
      stacks { create_list(:stack, 1) }
    end
  end

end