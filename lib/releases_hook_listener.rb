class ReleasesHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_show_details_bottom,
    :partial => 'hooks/show_attributes'

  render_on :view_issues_form_details_bottom,
    :partial => 'hooks/edit_attributes'

  def controller_issues_edit_before_save(context={ })
    params = context[:params]
    issue = context[:issue]

    if issue && params.include?(:issue) && params[:issue].include?(:releases)
      begin
        issue.releases = [Release.find_by_name(params[:issue][:releases])] 
      rescue ArgumentError, TypeError
        issue.remaining_hours = []
      end
    end
  end

end
