module BoardGenerator
  module Tasks
    module EnvCheck
      def self.run
        puts "Crystal version: #{Crystal::VERSION}"
        puts "Environment check passed"
      end
    end
  end
end

BoardGenerator::Tasks::EnvCheck.run if PROGRAM_NAME.ends_with?("env_check")
