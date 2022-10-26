Capistrano::DSL.stages.each do |stage|
  after stage, "check:running_process"
end

set :disallowed_running_processes, []

namespace :check do
  task :running_process do
    stdout, status = Open3.capture2("ps -o command")
    unless status.success?
      warn "Command failed: ps -o command"
      exit 1
    end
    processes = stdout.strip.each_line.map(&:strip)

    fetch(:disallowed_running_processes, []).each do |pattern|
      # rubocop:disable Style/CaseEquality
      next unless processes.any? {|process| pattern === process }
      # rubocop:enable Style/CaseEquality

      warn("=" * 80)
      warn("!!! Some #{pattern.inspect} process(es) are running. Please kill them. !!!")
      warn("=" * 80)
      exit 1
    end
  end
end
