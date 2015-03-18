module PersonalWikiPage
  # Registers this gems a Redmine plugin and applies the needed patches
  class RedminePlugin
    include PersonalWikiPage::Infos

    DEFAULT_SETTINGS = {
      "project" => "orga",
      "prefix"  => "PersonalWiki_"
    }.freeze

    SETTING_PARTIAL = "settings/personal_wiki_page_settings"

    def initialize
      register!
      boot!
      mirror_assets!
    end

    private

    def register!
      @plugin = Redmine::Plugin.register :personal_wiki_page do
        name NAME
        author AUTHORS.keys.join(", ")
        description DESCRIPTION
        version VERSION
        url URL
        author_url URL
        directory Engine.root

        settings default: DEFAULT_SETTINGS, partial:  SETTING_PARTIAL
      end
    end

    def boot!
      require "personal_wiki_page/hooks"
    end

    def mirror_assets!
      @plugin.mirror_assets
    end
  end
end
