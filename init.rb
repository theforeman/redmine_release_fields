require_dependency 'issue_patch'
require_dependency 'releases_hook_listener'

Redmine::Plugin.register :release_fields do
  name 'Release Fields plugin'
  author 'Foreman Community'
  description 'Plugin to add "Found In" and "Fixed In" multi-select closable fields'
  version '0.0.1'
  url 'https://github.com/theforeman/redmine_release_fields'
  author_url 'https://theforeman.org'

  project_module :releases do
    #permission :releases, { :releases => [:index] }, :public => true
    permission :view_releases, :releases => :index
    permission :edit_releases, :releases => :index
  end

  menu :project_menu, :releases, { :controller => 'releases', :action => 'index' }, :caption => 'Releases', :after => :activity, :param => :project_id
end
