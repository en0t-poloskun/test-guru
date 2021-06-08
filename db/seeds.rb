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
tests = Test.create!([{ name: 'Ruby', category: categories[0], author: users[1] },
                      { name: 'Dog breeds', level: 4, category: categories[1], author: users[1] },
                      { name: 'Python', level: 1, category: categories[0], author: users[1] },
                      { name: 'Birds', level: 6, category: categories[1], author: users[1] }])
questions = Question.create!([{ body: 'Ruby question 1', test: tests[0] },
                              { body: 'Ruby question 2', test: tests[0] },
                              { body: 'Dog breeds question 1', test: tests[1] },
                              { body: 'Dog breeds question 2', test: tests[1] },
                              { body: 'Python question 1', test: tests[2] },
                              { body: 'Python question 2', test: tests[2] },
                              { body: 'Birds question 1', test: tests[3] },
                              { body: 'Birds question 2', test: tests[3] }])
Answer.create!([{ body: 'Wrong answer for ruby question 1', question: questions[0] },
                { body: 'Correct answer for ruby question 1', correct: true, question: questions[0] },
                { body: 'Wrong answer for ruby question 2', question: questions[1] },
                { body: 'Correct answer for ruby question 2', correct: true, question: questions[1] },
                { body: 'Wrong answer for dog breeds question 1', question: questions[2] },
                { body: 'Correct answer for dog breeds question 1', correct: true, question: questions[2] },
                { body: 'Wrong answer for dog breeds question 2', question: questions[3] },
                { body: 'Correct answer for dog breeds question 2', correct: true, question: questions[3] },
                { body: 'Wrong answer for python question 1', question: questions[4] },
                { body: 'Correct answer for python question 1', correct: true, question: questions[4] },
                { body: 'Wrong answer for python question 2', question: questions[5] },
                { body: 'Correct answer for python question 2', correct: true, question: questions[5] },
                { body: 'Wrong answer for birds question 1', question: questions[6] },
                { body: 'Correct answer for birds question 1', correct: true, question: questions[6] },
                { body: 'Wrong answer for birds question 2', question: questions[7] },
                { body: 'Correct answer for birds question 2', correct: true, question: questions[7] }])
Result.create!([{ correct_answers: 2, incorrect_answers: 0, user: users[0], test: tests[0] },
                { correct_answers: 1, incorrect_answers: 1, user: users[0], test: tests[2] },
                { correct_answers: 1, incorrect_answers: 0, finished: false, user: users[0], test: tests[3] },
                { correct_answers: 2, incorrect_answers: 0, user: users[1], test: tests[3] }])
