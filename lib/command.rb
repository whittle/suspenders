# Methods needed to run a command.

module Suspenders
  module Command
    def run(cmd)
      puts "Running '#{cmd}'"
      out = `#{cmd}`
      fail "Command #{cmd} failed: #$?\n#{out}" if $? != 0
      out
    end

    def run_with_sudo(cmd)
      run(sudo? ? "sudo #{cmd}" : cmd)
    end

    private
    def sudo?
      ENV['SUDO'] == 'false' ? false : true
    end
  end
end
