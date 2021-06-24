# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)s
require 'bcrypt'

users = User.create!([{ first_name: 'Ivan', last_name: 'Ivanov', login: 'ivan4ik',
                        password_digest: BCrypt::Password.create('pass1'), email: 'ivan4ik@gmail.com', role: 'user' },
                      { first_name: 'Anna', last_name: 'Petrova', login: 'ann98',
                        password_digest: BCrypt::Password.create('pass2'), email: 'ann98@gmail.com', role: 'admin' }])
categories = Category.create!([{ name: 'programming' }, { name: 'animals' }])
tests = Test.create!([{ name: 'Ruby', category: categories[0], author: users[1] },
                      { name: 'Dog breeds', level: 4, category: categories[1], author: users[1] },
                      { name: 'Python', level: 1, category: categories[0], author: users[1] },
                      { name: 'Birds', level: 6, category: categories[1], author: users[1] }])

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
