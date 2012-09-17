require 'capistrano'

module Capistrano
  class Configuration
    module Actions
      module Invocation
        COMMAND_CURL_START = <<-EOF.gsub(/^\s*/, '')
          export CURL_HOME="${TMPDIR:-${HOME}}/.rvm-curl-config";
          mkdir "${CURL_HOME}/";
          printf "" > "$CURL_HOME/.curlrc";
          test -r "${HOME}/.curlrc" && cat "${HOME}/.curlrc" >> "$CURL_HOME/.curlrc";
          echo "show-error" >> "$CURL_HOME/.curlrc";
          echo "silent" >> "$CURL_HOME/.curlrc"
        EOF
        COMMAND_CURL_END = <<-EOF.gsub(/^\s*/, '')
          _command_status=$?;
          rm -rf "$CURL_HOME";
          exit $_command_status;
        EOF
        alias_method :run_verbose_curl, :run
        def run _command, options={}, *rest
          options ||= {}
          if options[:silent_curl]
            _command = [
              COMMAND_CURL_START,
              _command,
              COMMAND_CURL_END,
            ] * ";"
          end
          run_verbose_curl _command, options, *rest
        end
      end
    end
  end
end
