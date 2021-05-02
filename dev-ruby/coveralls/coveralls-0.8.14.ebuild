# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby implementation of the Coveralls API"
HOMEPAGE="https://coveralls.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/simplecov-0.12.0"
ruby_add_rdepend ">=dev-ruby/tins-1.6.0"
ruby_add_rdepend ">=dev-ruby/term-ansicolor-1.3"
ruby_add_rdepend ">=dev-ruby/thor-0.19.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"

