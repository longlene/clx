# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ost lets you manage queues and workers with Redis"
HOMEPAGE="http://github.com/soveran/ost"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redic-0"
ruby_add_rdepend ">=dev-ruby/nido-0"
ruby_add_rdepend ">=dev-ruby/cutest-0"

