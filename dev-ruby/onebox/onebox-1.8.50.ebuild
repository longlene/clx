# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A gem for generating embeddable HTML previews from URLs"
HOMEPAGE="https://github.com/discourse/onebox"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/multi_json-1.11"
ruby_add_rdepend ">=dev-ruby/mustache-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.7"
ruby_add_rdepend ">=dev-ruby/moneta-1.0"
ruby_add_rdepend ">=dev-ruby/htmlentities-4.3"
ruby_add_rdepend ">=dev-ruby/sanitize-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/fakeweb-1.3"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"
ruby_add_rdepend ">=dev-ruby/rubocop-0.50"
ruby_add_rdepend ">=dev-ruby/twitter-4.8"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.2.8"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-1.4"
ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/listen-2.10.0"

