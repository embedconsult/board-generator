require "./tasks/*"

module BoardGenerator
  VERSION = "0.1.0"

  class CLI
    def self.run(task : String)
      case task
      when "env_check"      then Tasks::EnvCheck.run
      when "generate_board" then Tasks::GenerateBoard.run
      when "generate_docs"  then Tasks::GenerateDocs.run
      else
        STDERR.puts "Unknown task: #{task}"
        STDERR.puts "Supported tasks: env_check, generate_board, generate_docs"
        exit 1
      end
    end
  end
end

if ARGV.empty?
  STDERR.puts "Usage: crystal run src/cli.cr -- <task>"
  exit 1
end

BoardGenerator::CLI.run(ARGV.first)
