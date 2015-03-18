# Add a new view hook into Redmine's template
MoreViewHooks.add(
  :layout_base_logged_as_before,
  virtual_path:  "layouts/base",
  insert_before: "#top-menu erb[loud]:contains('if User.current.logged?')" \
                 ":contains('content_tag')"
)

module PersonalWikiPage
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(_context)
      stylesheet_link_tag "personal_wiki_page", plugin: "personal_wiki_page"
    end

    def layout_base_logged_as_before(context)
      return "" if user.anonymous?
      view_context = context[:controller].view_context

      view_context.content_tag :ul, class: "personal-wiki-page" do
        view_context.content_tag :li do
          link_to_wiki_page
        end
      end
    end

    private

    def link_to_wiki_page
      link_to l(:personal_wiki_page_link), personal_wiki_path
    end

    def personal_wiki_path
      project_wiki_page_path(project_id: project, id: page)
    end

    def settings
      Setting.plugin_personal_wiki_page
    end

    def project
      settings["project"]
    end

    def prefix
      settings["prefix"]
    end

    def user
      User.current
    end

    def page
      "#{prefix}#{user.login}"
    end
  end
end
