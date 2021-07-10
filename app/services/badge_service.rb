# frozen_string_literal: true

class BadgeService
  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def give
    Badge.all.each do |badge|
      @current_user.badges.push(badge) if rule(badge)
    end
  end

  private

  def rule(badge)
    case badge.method
    when 'first_attempt'
      first_attempt(badge.argument)
    when 'all_tests_from'
      all_tests_from(badge.argument)
    when 'all_tests_of'
      all_tests_of(badge.argument.to_i)
    end
  end

  def first_attempt(test_id)
    test = Test.find(test_id)
    return unless @test_passage.test == test

    @test_passage == @current_user.first_attempt(test)
  end

  def all_tests_from(category)
    return unless @test_passage.test.category.name == category

    (Test.find_category(category).ids - @current_user.passed_tests.pluck(:test_id)).empty?
  end

  def all_tests_of(level)
    return unless @test_passage.test.level == level

    (Test.find_level(level).ids - @current_user.passed_tests.pluck(:test_id)).empty?
  end
end
