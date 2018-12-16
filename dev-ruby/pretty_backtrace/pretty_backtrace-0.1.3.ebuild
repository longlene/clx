# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pretty your exception backtrace"
HOMEPAGE="http://github.com/ko1/pretty_backtrace"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/debug_inspector-0.0.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

