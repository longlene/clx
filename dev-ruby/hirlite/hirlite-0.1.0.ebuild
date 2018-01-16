# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for hirlite"
HOMEPAGE="http://github.com/seppo0010/rlite-rb"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.7.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.5.1"
ruby_add_rdepend ">=dev-ruby/redis-3.2.0"

