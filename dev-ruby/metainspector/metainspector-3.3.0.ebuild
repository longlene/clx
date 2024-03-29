# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="MetaInspector lets you scrape a web page and get its title, charset, link and meta tags"
HOMEPAGE="http://jaimeiniesta.github.io/metainspector/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/faraday-0.9.0"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9.1"
ruby_add_rdepend ">=dev-ruby/faraday-cookie_jar-0.0.6"
ruby_add_rdepend ">=dev-ruby/addressable-2.3.5"
ruby_add_rdepend "=dev-ruby/rspec-2.14.1"
ruby_add_rdepend "=dev-ruby/fakeweb-1.3.0"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.2.0"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"
ruby_add_rdepend ">=dev-ruby/pry-0"

