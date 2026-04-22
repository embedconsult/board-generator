module BoardGenerator
  module Tasks
    module GenerateBoard
      def self.run
        puts "generate_board: placeholder pipeline"
      end
    end
  end
end

BoardGenerator::Tasks::GenerateBoard.run if PROGRAM_NAME.ends_with?("generate_board")
