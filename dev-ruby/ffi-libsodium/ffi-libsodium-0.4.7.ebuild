# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="libsodium ffi wrapper"
HOMEPAGE="https://github.com/Asmod4n/ruby-ffi-libsodium"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9.5"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"

