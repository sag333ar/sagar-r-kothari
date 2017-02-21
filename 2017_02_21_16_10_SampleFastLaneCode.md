```ruby
fastlane_version "1.106.2"

default_platform :ios

platform :ios do
  lane :beta do |values|
    ensure_git_status_clean
    increment_build_number(xcodeproj: "myApplication.xcodeproj")
    commit_version_bump(xcodeproj: "myApplication.xcodeproj")
    gym(scheme: 'myApplication', export_method: 'ad-hoc')

    emails = values[:test_email] ? values[:test_email] : ['sag333ar@gmail.com', 'sagar.digicorp@gmail.com'] # You can list more emails here
    groups = values[:test_email] ? nil : nil # You can define groups on the web and reference them here

    crashlytics(api_token: 'crashlytics_api_token',
             build_secret: 'crashlytics_build_secret',
                   emails: emails,
                   groups: groups,
                    notes: 'Distributed with fastlane', # Check out the changelog_from_git_commits action
            notifications: true) # Should this distribution notify your testers via email?

    # for all available options run `fastlane action crashlytics`

    # You can notify your team in chat that a beta build has been uploaded

    slack(
      slack_url: "https://hooks.slack.com/services/SOME/SLACK/HOOKID",
      message: "Successfully uploaded a beta release For myApplication - see it at https://fabric.io/_/beta",
      channel: "#my_slack_Channel", 
      payload: {
        "Build Date" => Time.new.to_s,
        "Built by" => "Fastlane, Fabric & Crashlytics",
      },
      default_payloads: [:git_branch, :git_author, :last_git_commit_message]
    )    

    push_to_git_remote
  end
end
```