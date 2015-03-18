require "personal_wiki_page/redmine_plugin"

module PersonalWikiPage
  # Simple engine to support the Redmine plugin
  class Engine < ::Rails::Engine
    config.to_prepare do
      RedminePlugin.new
    end
  end
end
