# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)s

admin = Admin.new(firstname: 'Anna', lastname: 'Petrova', login: 'ann98', password: 'password2',
                  email: 'ann98@gmail.com')
admin.skip_confirmation!
admin.save!

user = User.new(firstname: 'Ivan', lastname: 'Ivanov', login: 'ivan4ik', password: 'password1',
                email: 'ivan4ik@gmail.com')
user.skip_confirmation!
user.save!

categories = Category.create!([{ name: 'programming' }, { name: 'animals' }])

tests = Test.create!([{ name: 'Ruby', category: categories[0], author: admin },
                      { name: 'Dog breeds', level: 4, category: categories[1], author: admin },
                      { name: 'Python', level: 1, category: categories[0], author: admin },
                      { name: 'Birds', level: 6, category: categories[1], author: admin }])

question_bodies = ['Ruby question 1', 'Ruby question 2', 'Dog breeds question 1', 'Dog breeds question 2',
                   'Python question 1', 'Python question 2', 'Birds question 1', 'Birds question 2']

wrong_bodies = ['Wrong answer for ruby question 1', 'Wrong answer for ruby question 2',
                'Wrong answer for dog breeds question 1', 'Wrong answer for dog breeds question 2',
                'Wrong answer for python question 1', 'Wrong answer for python question 2',
                'Wrong answer for birds question 1', 'Wrong answer for birds question 2']

correct_bodies = ['Correct answer for ruby question 1', 'Correct answer for ruby question 2',
                  'Correct answer for dog breeds question 1', 'Correct answer for dog breeds question 2',
                  'Correct answer for python question 1', 'Correct answer for python question 2',
                  'Correct answer for birds question 1', 'Correct answer for birds question 2']

(0..question_bodies.size - 1).each do |i|
  question = Question.new(body: question_bodies[i], test: tests[i / 2])
  question.answers << Answer.new(body: wrong_bodies[i]) << Answer.new(body: correct_bodies[i], correct: true)
  question.save!
end

Badge.create!([{ name: 'Ruby test passed at the first attempt', image: 'ruby.png', method: 'first_attempt',
                 argument: '1' },
               { name: 'Passed all tests from animals category', image: 'dog.png', method: 'all_tests_from',
                 argument: 'animals' },
               { name: 'Passed all tests of level 1', image: 'confetti.png', method: 'all_tests_of', argument: '1' }])
