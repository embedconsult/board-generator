module BoardGenerator
  module Tasks
    module GenerateDocs
      def self.run
        puts "generate_docs: placeholder pipeline"
      end
    end
  end
end

BoardGenerator::Tasks::GenerateDocs.run if PROGRAM_NAME.ends_with?("generate_docs")
