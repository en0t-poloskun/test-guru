# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)s

users = User.create!([{ first_name: 'Ivan', last_name: 'Ivanov', login: 'ivan4ik', password: 'pass1', role: 'user' },
                      { first_name: 'Anna', last_name: 'Petrova', login: 'ann98', password: 'pass2', role: 'admin' }])
categories = Category.create!([{ name: 'programming' }, { name: 'animals' }])
tests = Test.create!([{ name: 'Ruby', category_id: categories[0].id, author_id: users[1].id },
                      { name: 'Dog breeds', category_id: categories[1].id, author_id: users[1].id },
                      { name: 'Python', level: 1, category_id: categories[0].id, author_id: users[1].id },
                      { name: 'Birds', level: 1, category_id: categories[1].id, author_id: users[1].id }])
questions = Question.create!([{ body: 'Ruby question 1', test_id: tests[0].id },
                              { body: 'Ruby question 2', test_id: tests[0].id },
                              { body: 'Dog breeds question 1', test_id: tests[1].id },
                              { body: 'Dog breeds question 2', test_id: tests[1].id },
                              { body: 'Python question 1', test_id: tests[2].id },
                              { body: 'Python question 2', test_id: tests[2].id },
                              { body: 'Birds question 1', test_id: tests[3].id },
                              { body: 'Birds question 2', test_id: tests[3].id }])
Answer.create!([{ body: 'Wrong answer for ruby question 1', question_id: questions[0].id },
                { body: 'Correct answer for ruby question 1', correct: true, question_id: questions[0].id },
                { body: 'Wrong answer for ruby question 2', question_id: questions[1].id },
                { body: 'Correct answer for ruby question 2', correct: true, question_id: questions[1].id },
                { body: 'Wrong answer for dog breeds question 1', question_id: questions[2].id },
                { body: 'Correct answer for dog breeds question 1', correct: true, question_id: questions[2].id },
                { body: 'Wrong answer for dog breeds question 2', question_id: questions[3].id },
                { body: 'Correct answer for dog breeds question 2', correct: true, question_id: questions[3].id },
                { body: 'Wrong answer for python question 1', question_id: questions[4].id },
                { body: 'Correct answer for python question 1', correct: true, question_id: questions[4].id },
                { body: 'Wrong answer for python question 2', question_id: questions[5].id },
                { body: 'Correct answer for python question 2', correct: true, question_id: questions[5].id },
                { body: 'Wrong answer for birds question 1', question_id: questions[6].id },
                { body: 'Correct answer for birds question 1', correct: true, question_id: questions[6].id },
                { body: 'Wrong answer for birds question 2', question_id: questions[7].id },
                { body: 'Correct answer for birds question 2', correct: true, question_id: questions[7].id }])
Result.create!([{ correct_answers: 2, incorrect_answers: 0, user_id: users[0].id, test_id: tests[0].id },
                { correct_answers: 1, incorrect_answers: 1, user_id: users[0].id, test_id: tests[2].id },
                { correct_answers: 1, incorrect_answers: 0, finished: false, user_id: users[0].id,
                  test_id: tests[3].id }])
