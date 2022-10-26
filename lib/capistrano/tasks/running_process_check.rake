Capistrano::DSL.stages.each do |stage|
  after stage, "check:running_process"
end

set :disallowed_running_processes, []

namespace :check do
  task :running_process do
    fetch(:disallowed_running_processes, []).each do |process_name|
      next unless system("pgrep -x #{process_name}", out: "/dev/null")

      warn("=" * 80)
      warn("!!! Some `#{process_name}` process(es) are running. Please kill them. !!!")
      warn("=" * 80)
      exit 1
    end
  end
end
