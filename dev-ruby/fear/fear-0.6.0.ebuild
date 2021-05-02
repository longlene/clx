# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby port of some Scala's monads"
HOMEPAGE="https://github.com/bolshakov/fear"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "=dev-ruby/dry-equalizer-0.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/spbtv_code_style-0"
ruby_add_rdepend "=dev-ruby/rubocop-rspec-1.13.0"
ruby_add_rdepend "=dev-ruby/rubocop-0.47.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

