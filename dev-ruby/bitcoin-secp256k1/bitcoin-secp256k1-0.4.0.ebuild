# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby binding to bitcoin's secp256k1 implementation"
HOMEPAGE="https://github.com/janx/ruby-bitcoin-secp256k1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9.10"
ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend "=dev-ruby/minitest-5.8.3"
ruby_add_rdepend "=dev-ruby/yard-0.8.7.6"

