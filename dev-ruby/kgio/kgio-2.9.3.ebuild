# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="kgio provides non-blocking I/O methods for Ruby without raising
exceptions on EAGAIN and EINPROGRESS"
HOMEPAGE="http://bogomips.org/kgio/"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/olddoc-1.0"
ruby_add_rdepend ">=dev-ruby/test-unit-3.0"

