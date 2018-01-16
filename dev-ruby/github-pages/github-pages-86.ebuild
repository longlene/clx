# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bootstrap the GitHub Pages Jekyll environment locally"
HOMEPAGE="https://github.com/github/pages-gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/jekyll-3.1.6"
ruby_add_rdepend "=dev-ruby/jekyll-sass-converter-1.3.0"
ruby_add_rdepend "=dev-ruby/kramdown-1.11.1"
ruby_add_rdepend "=dev-ruby/liquid-3.0.6"
ruby_add_rdepend "=dev-ruby/rouge-1.11.1"
ruby_add_rdepend "=dev-ruby/github-pages-health-check-1.1.0"
ruby_add_rdepend "=dev-ruby/jemoji-0.6.2"
ruby_add_rdepend "=dev-ruby/jekyll-mentions-1.1.3"
ruby_add_rdepend "=dev-ruby/jekyll-redirect-from-0.10.0"
ruby_add_rdepend "=dev-ruby/jekyll-sitemap-0.10.0"
ruby_add_rdepend "=dev-ruby/jekyll-feed-0.5.1"
ruby_add_rdepend "=dev-ruby/jekyll-gist-1.4.0"
ruby_add_rdepend "=dev-ruby/jekyll-paginate-1.1.0"
ruby_add_rdepend "=dev-ruby/jekyll-coffeescript-1.0.1"
ruby_add_rdepend "=dev-ruby/jekyll-seo-tag-2.0.0"
ruby_add_rdepend "=dev-ruby/jekyll-github-metadata-2.0.2"
ruby_add_rdepend "=dev-ruby/listen-3.0.6"
ruby_add_rdepend ">=dev-ruby/mercenary-0.3"
ruby_add_rdepend ">=dev-ruby/terminal-table-1.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/rubocop-0.35"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/jekyll_test_plugin_malicious-0.2"

