module PwaHelper

    def pwa_manifest
        "<link rel='manifest' href='manifest.json' />".html_safe
    end

end
