module BoardGenerator
  module Tasks
    module LintMarkdown
      MARKDOWN_GLOB = "boards/**/*.md"

      def self.run
        errors = [] of String

        Dir.glob(MARKDOWN_GLOB).sort.each do |path|
          content = File.read(path)
          errors.concat(validate_front_matter(path, content))
          errors.concat(validate_style(path, content))
        end

        if errors.empty?
          puts "markdown lint passed"
        else
          errors.each { |error| STDERR.puts(error) }
          exit 1
        end
      end

      private def self.validate_front_matter(path : String, content : String) : Array(String)
        errors = [] of String
        meta = extract_front_matter(content)

        if meta.nil?
          return ["#{path}: missing YAML front matter"]
        end

        file = File.basename(path)

        if file == "board.md"
          errors << "#{path}: board.md must include 'board'" unless meta.has_key?("board")
          errors << "#{path}: board.md must include 'doc: board'" unless meta["doc"]? == "board"
          errors << "#{path}: board.md must include 'canonical: true'" unless meta["canonical"]? == "true"
        else
          errors << "#{path}: avoid repeated board id; do not include 'board' in non-canonical docs" if meta.has_key?("board")
          expected_doc = File.basename(path, ".md")
          errors << "#{path}: expected 'doc: #{expected_doc}'" unless meta["doc"]? == expected_doc
          errors << "#{path}: missing 'purpose'" unless meta.has_key?("purpose")
        end

        errors
      end

      private def self.validate_style(path : String, content : String) : Array(String)
        errors = [] of String

        content.each_line.with_index(1) do |line, line_number|
          errors << "#{path}:#{line_number}: trailing whitespace" if line.ends_with?(" \n") || line.ends_with?("\t\n")
        end

        errors
      end

      private def self.extract_front_matter(content : String) : Hash(String, String)?
        lines = content.lines
        return nil unless lines.size >= 3
        return nil unless lines.first.strip == "---"

        closing_index = nil
        (1...lines.size).each do |i|
          if lines[i].strip == "---"
            closing_index = i
            break
          end
        end

        return nil if closing_index.nil?

        data = {} of String => String
        lines[1...closing_index.not_nil!].each do |line|
          next if line.strip.empty?
          parts = line.split(":", 2)
          next unless parts.size == 2
          key = parts[0].strip
          value = parts[1].strip
          data[key] = value
        end

        data
      end
    end
  end
end

BoardGenerator::Tasks::LintMarkdown.run if PROGRAM_NAME.ends_with?("lint_markdown")
