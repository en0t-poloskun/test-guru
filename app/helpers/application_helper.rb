# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow'
  end

  def flash_message(message)
    content_tag :p, flash[message], class: "flash #{message}" if flash[message]
  end
end
