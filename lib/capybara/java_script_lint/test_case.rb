module Capybara
  module JavaScriptLint
    class TestCase < ActionDispatch::IntegrationTest
      include ActionView::Helpers::JavaScriptHelper
      setup do
        Capybara.current_driver = :webkit
      end

      def self.check(path)
        options = @options || {}
        source = self.jslint_source
        test "JSLINT #{path}" do
          assert_jslint(path, options, source)
        end
      end

      def self.options(options)
        @options = options
      end

      private
      def self.jslint_source
        @jslint_source ||= File.read(Rails.root.join(*%w(vendor assets javascripts jslint.js)))
      end

      def assert_jslint(path, options, jslint)
        path = "/assets/#{path}"
        visit path
     
        doc = Nokogiri::HTML(page.body)
        source = doc.css('pre').first.content

        visit 'about:blank'
        page.execute_script jslint

        if !page.evaluate_script %{JSLINT("#{escape_javascript source}", #{options.to_json})}
          page.evaluate_script(%{JSLINT.errors}).each do |error|
            puts %{\n#{path}:#{error['line']}@#{error['character']}: #{error['reason']}\n#{error['evidence']}}
          end
          flunk 'JSLINT Errors'
        end
      end
    end
  end
end

