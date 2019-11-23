# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="tools to create new Solidus extensions"
HOMEPAGE="http://solidus.io"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend "=dev-ruby/rubocop-0.37.2"
ruby_add_rdepend "=dev-ruby/rubocop-rspec-1.4.0"
ruby_add_rdepend ">=dev-ruby/thor-0.14"

