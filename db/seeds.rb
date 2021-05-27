# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)s

User.create([{ first_name: 'Ivan', last_name: 'Ivanov', login: 'ivan4ik', password: 'pass1', role: 'user' },
             { first_name: 'Anna', last_name: 'Petrova', login: 'ann98', password: 'pass2', role: 'admin' }])
Category.create([{ name: 'programming' }, { name: 'animals' }])
Test.create([{ name: 'Ruby', category_id: 1, author_id: 2 },
             { name: 'Dog breeds', category_id: 2, author_id: 2 },
             { name: 'Python', level: 1, category_id: 1, author_id: 2 },
             { name: 'Birds', level: 1, category_id: 2, author_id: 2 }])
Question.create([{ body: 'Ruby question 1', test_id: 1 }, { body: 'Ruby question 2', test_id: 1 },
                 { body: 'Dog breeds question 1', test_id: 2 }, { body: 'Dog breeds question 2', test_id: 2 },
                 { body: 'Python question 1', test_id: 3 }, { body: 'Python question 2', test_id: 3 },
                 { body: 'Birds question 1', test_id: 4 }, { body: 'Birds question 2', test_id: 4 }])
Answer.create([{ body: 'Wrong answer for ruby question 1', question_id: 1 },
               { body: 'Correct answer for ruby question 1', correct: true, question_id: 1 },
               { body: 'Wrong answer for ruby question 2', question_id: 2 },
               { body: 'Correct answer for ruby question 2', correct: true, question_id: 2 },
               { body: 'Wrong answer for dog breeds question 1', question_id: 3 },
               { body: 'Correct answer for dog breeds question 1', correct: true, question_id: 3 },
               { body: 'Wrong answer for dog breeds question 2', question_id: 4 },
               { body: 'Correct answer for dog breeds question 2', correct: true, question_id: 4 },
               { body: 'Wrong answer for python question 1', question_id: 5 },
               { body: 'Correct answer for python question 1', correct: true, question_id: 5 },
               { body: 'Wrong answer for python question 2', question_id: 6 },
               { body: 'Correct answer for python question 2', correct: true, question_id: 6 },
               { body: 'Wrong answer for birds question 1', question_id: 7 },
               { body: 'Correct answer for birds question 1', correct: true, question_id: 7 },
               { body: 'Wrong answer for birds question 2', question_id: 8 },
               { body: 'Correct answer for birds question 2', correct: true, question_id: 8 }])
