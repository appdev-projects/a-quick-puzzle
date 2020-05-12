module ActionDispatch
  class Request
    class Session
      alias fetch []
      alias store []=
    end
  end

  class Cookies
    class CookieJar
      alias fetch []
      alias store []=

      def keys
        entries.map(&:first)
      end
    end
  end
end
