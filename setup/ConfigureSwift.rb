module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      keep_demo = configurator.ask_with_answers("Você gostaria de adicionar um template em sua biblioteca", ["Sim", "Não"]).to_sym

      configurator.set_test_framework "xctest", "swift", "swift"

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => ""
      }).run

      `mv ./templates/swift/* ./`
      `mv ./templates/mvvmc/* Pod/Classes/`

      # The Podspec should be 8.0 instead of 7.0
      text = File.read("NAME.podspec")
      text.gsub!("7.0", "8.0")
      File.open("NAME.podspec", "w") { |file| file.puts text }

      # remove podspec for osx
      `rm ./NAME-osx.podspec`
    end
  end

end
