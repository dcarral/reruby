module Reruby

  module Actions

    class FileRewrite < Rewrite

      attr_reader :path, :rewriter

      def initialize(path: nil, rewriter: nil)
        @path = path
        @rewriter = rewriter
      end

      def perform
        Reruby.logger.info "Rewriting in #{path}"
        old_code = File.read(path)
        new_code = rewrite(old_code)

        File.write(path, new_code) if old_code != new_code
      end

    end

  end
end
