class ReleasesHookListener < Redmine::Hook::ViewListener
  # View Hooks to add fields to Issue#show and Issue#edit
  render_on :view_issues_show_details_bottom,
    :partial => 'hooks/show_attributes'

  render_on :view_issues_form_details_bottom,
    :partial => 'hooks/edit_attributes'

  # Controller hook to set versions on save
  def controller_issues_edit_before_save(context={ })
    params = context[:params]
    issue = context[:issue]

    if issue && params.include?(:issue) && params[:issue].include?(:found_versions)
      begin
        # TODO: add separate permission to *remove* versions, normal users can only append
        issue.found_version_ids = params[:issue][:found_versions]
      rescue ArgumentError, TypeError
        # change nothing
      end
    end
    if issue && params.include?(:issue) && params[:issue].include?(:fixed_versions)
      begin
        # TODO: add separate permission to *remove* versions, normal users can only append
        issue.fixed_version_ids = params[:issue][:fixed_versions]
      rescue ArgumentError, TypeError
        # change nothing
      end
    end
  end

end
