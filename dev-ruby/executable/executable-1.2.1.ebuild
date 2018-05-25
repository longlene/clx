# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Think of Executable as a *COM*, a Commandline Object Mapper,
in much the same way that ActiveRecord is an ORM,
an Object Relational Mapper"
HOMEPAGE="http://rubyworks.github.com/executable"

LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/qed-0"
ruby_add_rdepend ">=dev-ruby/ae-0"
ruby_add_rdepend ">=dev-ruby/detroit-0"

