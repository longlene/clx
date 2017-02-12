# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="MetaInspector lets you scrape a web page and get its links, images, texts, meta tags"
HOMEPAGE="https://github.com/jaimeiniesta/metainspector"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.10"
ruby_add_rdepend ">=dev-ruby/faraday-cookie_jar-0.0"
ruby_add_rdepend ">=dev-ruby/faraday-http-cache-1.2"
ruby_add_rdepend ">=dev-ruby/faraday-encoding-0.0.3"
ruby_add_rdepend ">=dev-ruby/addressable-2.4"
ruby_add_rdepend ">=dev-ruby/fastimage-2.0"
ruby_add_rdepend ">=dev-ruby/nesty-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend "=dev-ruby/fakeweb-1.3.0"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"

