# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Analyze HTTP Requests"
HOMEPAGE="http://github.com/aderyabin/sniffer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/anyway_config-1.0"
ruby_add_rdepend ">=dev-ruby/active_attr-0.10.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.15"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.50"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/sinatra-2.0"
ruby_add_rdepend ">=dev-ruby/puma-3.10.0"
ruby_add_rdepend ">=dev-ruby/httpclient-2.8.3"
ruby_add_rdepend ">=dev-ruby/http-3.0.0"
ruby_add_rdepend ">=dev-ruby/patron-0.10.0"
ruby_add_rdepend ">=dev-ruby/curb-0.9.4"
ruby_add_rdepend ">=dev-ruby/ethon-0.11.0"
ruby_add_rdepend ">=dev-ruby/typhoeus-0.9.0"

