module Jekyll
  class ArtistPageGenerator < Generator
    safe true

    def generate(site)
      site.data['artists'].each do |filename, artist|
        site.pages << ArtistPage.new(site, site.source, File.join('/artist'), artist)
      end
    end
  end

  class ArtistPage < Page
    def initialize(site, base, dir, artist)
      @site = site
      @base = base
      @dir  = dir
      @name = "#{artist['name'].downcase.tr(' ', '-')}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'artist.html')
      self.data['artist'] = artist
    end
  end
end

