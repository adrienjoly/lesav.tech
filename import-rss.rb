require 'jekyll-import'
importer_class = "RSS"
options = {
    "source": "https://anchor.fm/s/e7a67d1c/podcast/rss",
    "tag": "rss",
    "render_audio": true
}
JekyllImport::Importers.const_get(importer_class).run(options)
