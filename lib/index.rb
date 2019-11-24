require 'json'
require 'octokit'
require_relative './merge_branch_service'

@event = JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))
@head_to_merge = ENV['GITHUB_SHA'] # or brach name
@repository = ENV['GITHUB_REPOSITORY']
@github_token = ENV['GITHUB_TOKEN']
@base_branch = ENV['INPUT_BASE_BRANCH']
@label_name = ENV['INPUT_LABEL_NAME']
@type = ENV['INPUT_TYPE'] || 'push' # labeled | push

service = MergeBrachService.new(
  event: @event, type: @type, base_branch: @base_branch, label_name: @label_name
)
service_base_branch = service.base_branch

<<<<<<< HEAD
if service_base_branch
  @client = Octokit::Client.new(access_token: @github_token)
  @client.merge(@repository, service_base_branch, @head_to_merge)
  puts "Finish merge brach #{service_base_branch}"
else
  puts 'Skip'
=======
def run
  adapter = build_adapter
  unless adapter.valid?
    puts 'Skip'
    return 'Skip'
  end

  adapter.base_branch.tap do |base_branch|
    raise 'Could not find branch name' unless base_branch

    merge_to(base_branch)
  end
>>>>>>> fd6c1365bd6e6a1440c0c031bc956a061f2309c4
end