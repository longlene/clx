# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby-like wrapper for ffi-rzmq-core (ZeroMQ)"
HOMEPAGE="https://github.com/jemc/0mq/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-rzmq-core-1.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/pry-0.9"
ruby_add_rdepend ">=dev-ruby/pry-rescue-1.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.0"
ruby_add_rdepend ">=dev-ruby/fivemat-1.3"
ruby_add_rdepend ">=dev-ruby/yard-0.8"

