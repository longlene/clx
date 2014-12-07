# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Byebug is a Ruby 2 debugger"
HOMEPAGE="http://github.com/deivid-rodriguez/byebug"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/columnize-0.8"
ruby_add_rdepend ">=dev-ruby/slop-3.6"
ruby_add_rdepend ">=dev-ruby/debugger-linecache-1.2"

