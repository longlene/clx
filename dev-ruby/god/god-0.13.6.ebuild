# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An easy to configure, easy to extend monitoring framework written in Ruby"
HOMEPAGE="http://god.rubyforge.org/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.6"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/rdoc-3.10"
ruby_add_rdepend ">=dev-ruby/twitter-4.0"
ruby_add_rdepend ">=dev-ruby/prowly-0.3"
ruby_add_rdepend ">=dev-ruby/xmpp4r-0.5"
ruby_add_rdepend ">=dev-ruby/dike-0.0.3"
ruby_add_rdepend ">=dev-ruby/daemons-1.1"
ruby_add_rdepend ">=dev-ruby/mocha-0.10"
ruby_add_rdepend ">=dev-ruby/gollum-1.3.1"
ruby_add_rdepend ">=dev-ruby/mustache-0.99.0"
ruby_add_rdepend ">=dev-ruby/airbrake-3.1.7"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.0"
ruby_add_rdepend ">=dev-ruby/activesupport-2.3.10"
ruby_add_rdepend ">=dev-ruby/statsd-ruby-0"
ruby_add_rdepend ">=dev-ruby/i18n-0.7.0"

